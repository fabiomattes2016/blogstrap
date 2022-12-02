source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.7'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "~> 1.5"
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem "letter_opener", "~> 1.8"
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "ruby-lsp", "~> 0.3.6", :group => :development
gem "simple_form", "~> 5.1"
gem "kaminari", "~> 1.2"
gem "devise", "~> 4.8"
gem "pundit", "~> 2.2"
gem 'rolify', '~> 6.0'
gem "groupdate", "~> 6.1"
gem 'lorem_ipsum_amet'
gem 'pg', '~> 1.4', '>= 1.4.5', group: :production
