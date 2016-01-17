require 'test_helper'

class ListingDriversTest < ActionDispatch::IntegrationTest
  test "list all drivers" do
    get drivers_path 

    assert_response :success
    refute_empty response.body
  end

  test 'list drivers by name' do
    get drivers_path, name: 'Driver1' 

    assert_found(:one)
  end 

  test 'list drivers by plate' do
    get drivers_path, car_plate: 'ABC1234' 

    assert_found(:one)
  end

  test 'list drivers by name and plate' do
    get drivers_path, name: 'Driver2', car_plate: 'DEF5678' 

    assert_found(:two)
  end

  test 'list non existant driver' do
    get drivers_path, name: 'no one'

    assert_response :success
    assert_equal [], JSON.parse(response.body)

    get drivers_path, car_plate: 'ABC0000'

    assert_response :success
    assert_equal [], JSON.parse(response.body)
  end

  private

  def assert_found(driver)
    assert_response :success

    drivers = JSON.parse(response.body)
    assert_equal 1, drivers.length
    assert_equal drivers(driver).attributes, drivers.first
  end
end
