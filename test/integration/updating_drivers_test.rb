require 'test_helper'

class UpdatingDriversTest < ActionDispatch::IntegrationTest
  test 'updating position' do
    put driver_status_path(drivers(:one), driver_positions(:one)), driver_position: { latitude: 35.899 }

    assert_response :success
    assert_equal 35.899, driver_positions(:one).reload.latitude
  end

  test 'updating availability' do
    put driver_status_path(drivers(:two), driver_positions(:two)), driver_position: { driver_available: true }

    assert_response :success
    assert driver_positions(:two).reload.driver_available
  end

  test 'do not update invalid position' do
    put driver_status_path(drivers(:one), driver_positions(:two)), driver_position: {}

    assert_response :not_found
  end

  test 'do not update invalid attributes' do
    put driver_status_path(drivers(:one), driver_positions(:one)), driver_position: { foo: 'banga' }

    assert_response :success
    assert_nil driver_positions(:one).reload.attributes[:foo]
  end
end
