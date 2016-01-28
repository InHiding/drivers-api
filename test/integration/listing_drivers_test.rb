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
    get drivers_path, car_plate: 'ABC 1234' 

    assert_found(:one)
  end

  test 'list drivers by name and plate' do
    get drivers_path, name: 'Driver2', car_plate: 'DEF 5678' 

    assert_found(:two)
  end

  test 'list driver non existant driver' do
    get drivers_path, name: 'no one'

    assert_response :success
    assert_equal [], JSON.parse(response.body)

    get drivers_path, car_plate: 'ABC 0000'

    assert_response :success
    assert_equal [], JSON.parse(response.body)
  end

  test 'list driver by id' do                                                          
    driver = drivers(:one)                                                                

    get driver_path(driver.id)

    assert_equal 200, response.status                                                     
    driver_response = JSON.parse(response.body, symbolize_names: true)                    
    assert_equal driver.name, driver_response[:name]                                      
  end 

  private

  def assert_found(driver)
    assert_response :success

    drivers = JSON.parse(response.body)
    assert_equal 1, drivers.length
    assert_equal drivers(driver).attributes, drivers.first
  end
end
