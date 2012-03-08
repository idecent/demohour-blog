gem 'mysql2'

require 'fileutils'
require 'yaml'

source 'http://ruby.taobao.org/'
gem 'rails', '3.0.10'
gem 'require_relative'
gem 'htmlentities'
gem 'json'
gem 'bluecloth', '>= 2.0.5'
gem 'coderay', '~> 0.9'
gem 'will_paginate', '3.0.pre2'
gem 'RedCloth', '4.2.8'
gem 'addressable', '~> 2.1.0', :require => 'addressable/uri'
gem 'mini_magick', '1.3.3', :require => 'mini_magick'
gem 'uuidtools', '~>2.1.1'
gem 'flickraw-cached'
gem 'rubypants', '~> 0.2.0'
gem 'rake', '>= 0.9.2' 
gem 'acts_as_list'
gem 'acts_as_tree_rails3'
gem 'recaptcha', :require => 'recaptcha/rails', :branch => 'rails3'

group :development, :test do
  if RUBY_VERSION.include?('1.9')
    gem 'ruby-debug19'
  else
    gem 'ruby-debug'
  end
  gem 'factory_girl'
  gem 'webrat'
  gem 'rspec-rails', '>= 2.0.0.beta.20'
  # gem 'rcov'
end
