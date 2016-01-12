require 'test_helper'

class ListingDriversTest < ActionDispatch::IntegrationTest
  test "list all drivers" do
    get '/drivers'

    assert response.success?
    refute_empty response.body
  end
end
