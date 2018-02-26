
require 'airborne'
require 'faker'
require_relative '../app/app'

@env = ENV['RACK_ENV']

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end

Airborne.configure do |config|
  case @env
  when 'development'
    config.rack_app = Sinatra::Application
  when 'testing'
    config.base_url = 'https://blog-api-testing.herokuapp.com/'
    config.headers = {
      content_tyoe: 'application/json'
    }
  end
end
