class DriverPosition < ActiveRecord::Base
  scope :in_area, -> (params) { where(extract_coords(params)) if params }
  scope :available, -> { where(driver_available: true) }
  scope :recent, -> { order(updated_at: :desc) }
  belongs_to :driver

  validates :driver, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :driver_available, default: false

  private

  def self.extract_coords(params)
    return unless params[:sw] && params[:ne]

    sw = params[:sw].split(',').map(&:to_f) 
    ne = params[:ne].split(',').map(&:to_f) 

    { 
      latitude: sw[0]..ne[0], 
      longitude: sw[1]..ne[1],
    }
  end
end
