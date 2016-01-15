require 'test_helper'

class ListingDriversTest < ActionDispatch::IntegrationTest
  test "list all drivers" do
    get '/drivers'

    assert response.success?
    refute_empty response.body
  end

  test 'list drivers by name' do
    get '/drivers?name=Driver1'

    assert response.success?

    drivers = JSON.parse(response.body)
    assert_equal 1, drivers.length
    assert_equal drivers(:one).attributes, drivers.first
  end 

  test 'list drivers by plate' do
    get '/drivers?car_plate=ABC1234'

    drivers = JSON.parse(response.body)
    assert_equal 1, drivers.length
    assert_equal drivers(:one).attributes, drivers.first
  end

  test 'list drivers by name and plate' do
    get '/drivers?name=Driver2&car_plate=DEF5678'

    drivers = JSON.parse(response.body)
    assert_equal 1, drivers.length
    assert_equal drivers(:two).attributes, drivers.first
  end

  test 'list non existant driver' do
    get '/drivers?name=noone'

    assert response.success?
    assert_equal [], JSON.parse(response.body)
  end
end
