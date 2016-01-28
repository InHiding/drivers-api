require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test 'invalid empty driver' do
    driver = Driver.new
    assert !driver.valid?
  end

  test 'invalid without name' do
    driver = drivers(:one)
    driver.name = nil
    
    assert !driver.valid?
    assert_match %r{can't be blank}, driver.errors[:name].join
  end

  test 'invalid without plate' do
    driver = drivers(:one)
    driver.car_plate = nil

    assert !driver.valid?
    assert_equal I18n.t('plate_format'), driver.errors[:car_plate].join
  end

  test 'plate with invalid format' do
    driver = drivers(:two)
    driver.car_plate = 'abc-1234'

    assert !driver.valid?
    assert_equal I18n.t('plate_format'), driver.errors[:car_plate].join
  end

  test 'upcase car plate' do
    driver = drivers(:two)
    plate = driver.car_plate.downcase!

    assert driver.valid?
    assert_equal plate.upcase, driver.car_plate 
  end

  test 'valid with all attributes' do
    driver = drivers(:one)

    assert driver.valid?
  end
end
