require 'test_helper'

class CreateDriverPositionTest < ActionDispatch::IntegrationTest
  test 'do not create position if one already exists for this driver' do
    post driver_status_index_path(drivers(:two)), driver_position: position_attributes 

    assert_error(:driver, %r{has already been taken})
  end

  test 'do not create position if driver invalid' do
    post driver_status_index_path('blah'), driver_position: position_attributes

    assert_error(:driver, %r{can't be blank})
  end

  test 'do not create position without coordinates' do
    post driver_status_index_path('blah'), driver_position: { driver_available: true}

    assert_error(:latitude, %r{can't be blank})
    assert_error(:longitude, %r{can't be blank})  
  end

  test 'create a driver' do
    post driver_status_index_path(drivers(:three)), driver_position: position_attributes 

    assert_equal 204, response.status
    assert_equal driver_status_index_url, response.location
  end

  private

  def position_attributes
    {
      latitude: 23.3345,
      longitude: -10.9888,
      driver_available: false
    }
  end
end
