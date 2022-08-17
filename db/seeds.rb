require 'faker'
Faker::Config.locale = :en

system('clear')
puts "How many records ?"
total_record = gets.strip().to_i
puts "🌱 Seeding #{total_record.to_i} Users ..."

spinner = Enumerator.new do |e|
    loop do
        e.yield '|'
        e.yield '/'
        e.yield '-'
        e.yield '\\'
    end
end


