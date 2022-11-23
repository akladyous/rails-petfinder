source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.4', '>= 1.4.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0', '>= 7.0.4'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'image_processing', '~> 1.2'
gem 'pagy', '~> 5.10', '>= 5.10.1'

group :development, :test do
end

group :development do
  # gem 'coderay', '~> 1.1', '>= 1.1.3'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'erb_lint', require: false
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main', require: false
  gem 'htmlbeautifier', '~> 1.3', '>= 1.3.1'
  gem 'ruby-prof', '~> 0.16.2'
  gem 'solargraph', '~> 0.47.0'
  gem 'solargraph-rails', '~> 0.3.1'
  gem 'web-console'
  # gem "rack-mini-profiler"
  # gem "spring"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
