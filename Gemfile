source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'
gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.12'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'aws-sdk-s3', require: false
gem 'pg', '~> 0.18.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development, :test do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'rubocop', '~> 0.58.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
