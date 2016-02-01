require 'test_helper'

class CreateDriverTest < ActionDispatch::IntegrationTest
  test 'do not create driver without name' do
    post drivers_path, driver: { car_plate: 'CAR 4000' }

    assert_error(:name, %r{can't be blank})
  end

  test 'do not create driver without plate' do
    post drivers_path, driver: { name: 'No plate driver' }

    assert_error(:car_plate, I18n.t('plate_format'))
  end

  test 'do not create driver with invalid plate' do
    post drivers_path, driver: { name: 'My plate is wrong', car_plate: 'BLAH 123' }

    assert_error(:car_plate, I18n.t('plate_format'))
  end

  test 'create a driver' do
    post drivers_path, driver: { name: 'Taxi Driver', car_plate: 'DEN 1800' } 

    assert_equal 204, response.status
    assert_equal driver_url(Driver.last.id), response.location
  end
end
