require 'faker'
Faker::Config.locale = :en

system('clear')
puts 'How many records ?'
total_record = gets.strip.to_i - 1
puts "🌱 Seeding #{total_record.to_i} Users ..."

spinner = Enumerator.new do |e|
  loop do
    e.yield '|'
    e.yield '/'
    e.yield '-'
    e.yield '\\'
  end
end

def generate_pet
  species = -> { %w[dog cat].sample }.call
  {
    name: Faker::Creature::Animal.name,
    species:,
    gender: %w[male female unknown].sample,
    size: %w[small medium large].sample,
    breed: -> { species == 'dog' ? Faker::Creature::Dog.breed : Faker::Creature::Cat.breed }.call,
    color: lambda {
             ['Black and tan',
              'brown and tan',
              'Bicolor',
              'Irish spotted',
              'Flashy',
              'Patched',
              'Tuxedo',
              'Tricolor',
              'Spotted',
              'Flecked',
              'ticked',
              'speckled',
              'Brindle',
              'Sable'].sample
           }.call,
    coat: lambda {
            [
              'Hairless',
              'Curly-Coated',
              'Wire-Coated',
              'Long-Coated',
              'Short-Coated',
              'Medium-Coated',
              'Smooth',
              'Double and Single Coated',
              'Silky Coated',
              'Rough Coated',
              "Wire ,
        Coated",
              'Hairless',
              'Drying a silky coated',
              'Washing a silky coated',
              'Drying a double coated'
            ].sample
          }.call,
    age: rand(1..15),
    height: rand(0.65..3.28).round(2),
    weight: rand(15..145),
    microchip: -> { rand.to_s[2..9] }.call,
    collar: [true, false].sample,
    description: Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 4)
  }
end

def generate_listing
  address = Faker::Address.full_address
  {
    listing_type: -> { %w[lost found].sample }.call,
    lost_found_date: -> { rand(1.year.ago..2.month.ago) }.call,
    address:,
    crossroads: address.split(',').first,
    pet_description: Faker::Lorem.paragraph(sentence_count: 6, supplemental: false, random_sentences_to_add: 4),
    comment: Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 4)
  }
end

def generate_user
  {
    email: Faker::Internet.unique.email,
    password: '000000',
    password_confirmation: '000000'
  }
end

total_record.times do |idx|
  User.new(generate_user) do |user|
    printf("\rGenerating  records: %s", spinner.next)
    user.save
    user_listings = -> { rand(1..10) }.call
    user_listings.times do
      user.listings.new(generate_listing) do |listing|
        listing.build_pet(generate_pet)

        species = listing.pet.species.pluralize
        folder =  -> { "#{Rails.root}/app/assets/images/#{species}".downcase }
        images = -> { Dir.entries(folder.call) - %w[. .. .DS_Store] }
        listing.pet.image.attach(io: File.open("#{folder.call}/#{images.call[idx]}"), filename: images.call[idx])

        listing.save
      end
    end
  end
end

$stdout.flush
printf("\rGenerating records completed!")
printf("\r\n")
puts '✅ Done seeding!'
