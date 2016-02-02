require 'test_helper'

class ListingDriverPositionsTest < ActionDispatch::IntegrationTest
  test 'list driver position' do
    get driver_status_index_path(drivers(:one))
 
    position = JSON.parse(response.body)

    assert_response :success
    assert_equal drivers(:one).id, position['driver_id'] 
  end

  test 'does not list position for invalid driver' do
    get driver_status_index_path('none')

    assert_response :not_found
  end
end
