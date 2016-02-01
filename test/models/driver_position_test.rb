require 'test_helper'

class DriverPositionTest < ActiveSupport::TestCase
  test 'invalid empty driver_position' do
    driver_position = DriverPosition.new
    assert !driver_position.valid?
  end

  test 'invalid without driver' do
    driver_position = driver_positions(:one)
    driver_position.driver = nil
    
    assert !driver_position.valid?
    assert_match %r{can't be blank}, driver_position.errors[:driver].join
  end

  test 'invalid without coordinates' do
    driver_position = driver_positions(:one)
    driver_position.latitude = nil
    driver_position.longitude = nil

    assert !driver_position.valid?
    assert_match %r{can't be blank}, driver_position.errors[:latitude].join
    assert_match %r{can't be blank}, driver_position.errors[:longitude].join
  end

  test 'driver should be unique on driver positions' do
    driver_position = create_new_position(:two) 

    assert !driver_position.valid?
    assert_match %r{has already been taken}, driver_position.errors[:driver].join
  end

  test 'new position should set driver unavailable' do
    driver_position = create_new_position(:three) 

    assert_equal driver_position.driver_available, false 
  end

  test 'valid with all attributes' do
    driver_position = create_new_position(:three) 

    assert driver_position.valid?
  end

  private

  def create_new_position(driver)
    DriverPosition.new(latitude: -10.1, longitude: 9.45, driver: drivers(driver))
  end
end
