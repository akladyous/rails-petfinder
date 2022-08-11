json.extract! pet, :id, :name, :species, :breed, :gender, :age, :size, :color, :height, :weight, :coat, :microchip, :collar, :description, :user_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
