class Pet < ApplicationRecord
  ActiveStorage::Current.host = "http://localhost:3000"

  belongs_to :listing
  has_one_attached :image

  enum :species, {
    dog: 0,
    cat: 1,
    bird: 2,
    horse: 3,
    rabbit: 4,
    reptile: 5,
    ferret: 6,
    other: 7,
  }, default: :dog
  enum :gender, { male: 0, female: 1, unknown: 2}, default: :male
  enum :size, { small: 0, medium: 1, large: 2, giant: 3 }, default: :small

end

# p1.image.attach(io: File.open("/Users/boula/Documents/cheatah.jpg"), filename: "cheatah.jpg", content_type: "image/jpeg")
