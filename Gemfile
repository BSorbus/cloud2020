source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.8.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.6.2'
gem 'nokogiri', '~> 1.13.9'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
#gem 'uglifier', '~> 3.0.4'
# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'mini_racer', platforms: :ruby
gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'brakeman', require: false
end

gem 'listen', '>= 3.0.5'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rails-i18n'
gem 'bootstrap-sass', '3.4.1'

gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

# Use jquery as the JavaScript library 2017.06.19
gem 'jquery-rails'
gem 'font_awesome5_rails'
gem 'select2-rails', '3.5.9.3'
gem "kaminari", ">= 1.2.1"

gem 'redis-rails'
gem "hiredis"
gem "redis", "~> 4.0"

gem 'rack-attack'

gem 'jquery-datatables', '= 1.10.19.1' #1.10.16 bo z .19 jest jakis problem z wyswietlaniem strzalek sortowania
gem 'ajax-datatables-rails', '= 1.2.0' #, '= 1.3.1' wywala blad w module zalacznikow

gem "actionpack-page_caching", ">= 1.2.2"
gem "actionpack-action_caching"

gem 'whenever', require: false

gem 'mina'
gem 'mina-whenever', require: false

gem 'piwik_analytics'

gem "devise", ">= 4.7.1"
gem 'devise_saml_authenticatable'
gem 'pundit'

gem 'inky-rb', require: 'inky'
gem 'premailer-rails'
gem 'trix-rails', require: 'trix'

gem 'carrierwave', '~> 2.0'
gem 'mini_magick'
gem 'jquery-fileupload-rails'
gem 'file_validators'

gem 'closure_tree'
gem 'rubyzip'

# security alert
gem "rack", ">= 2.2.3"
gem "websocket-extensions", ">= 0.1.5"
gem "addressable", ">= 2.8.1"
gem 'mail', '!= 2.8.0'