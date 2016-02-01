class DriverPosition < ActiveRecord::Base
  belongs_to :driver

  validates :driver, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :driver_available, default: false
end
