class Pet < ApplicationRecord
  belongs_to :user

  validates :name, :species, :breed, :gender, :age, :size, presence: true

  enum :gender, { male: 0, female: 1 }, default: :male
  enum :size, { small: 0, medium: 1, large: 2 }, default: :small
  enum :species, { dog: 0, cat: 1 }, default: :dog
end
