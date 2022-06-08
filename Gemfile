source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'dotenv', '~> 2.4'

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
  gem 'capistrano', '~> 3.17', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0'
  gem 'ed25519', '~> 1.2'
  gem 'bcrypt_pbkdf', '~> 1.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  gem 'puma', '~> 5.6'
end
