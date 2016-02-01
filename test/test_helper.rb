ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_error(key, message)
    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type

    errors = JSON.parse(response.body, symbolize_names: true)
    assert_match message, errors[key].join 
  end
end
