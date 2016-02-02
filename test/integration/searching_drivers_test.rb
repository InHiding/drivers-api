require 'test_helper'

class SearchingDriversTest < ActionDispatch::IntegrationTest
  test 'search only available drivers' do
    get in_area_drivers_path, sw: '-10,-10', ne: '10,10', available: true

    assert_found(:one, 1)
  end

  test 'search all drivers inside an area' do
    get in_area_drivers_path, sw: '-10,0', ne: '10,10'

    assert_found(:two, 1)
  end

  test 'search without area coordinates' do
    get in_area_drivers_path

    assert_error
  end

  test 'search with incomplete area coordinates' do
    get in_area_drivers_path, sw: '-11.22,10.345'

    assert_error
  end

  private

  def assert_error
    assert_response :bad_request
    assert_match I18n.t('invalid_area'), response.body
  end

  def assert_found(key, total_results)
    positions = JSON.parse(response.body)

    assert_response :success
    assert_equal total_results, positions.count { |p| p['id'] == driver_positions(key).id }
  end
end
