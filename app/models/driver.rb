class Driver < ActiveRecord::Base
  before_validation :normalize_plate

  validates :name, presence: true
  validates :car_plate, format: { with: %r{[a-zA-Z]{3}\ \d{4}\z}, 
                                  message: I18n.t('plate_format') }

  protected

  def normalize_plate
    return if car_plate.blank?
    car_plate.upcase!
  end
end
