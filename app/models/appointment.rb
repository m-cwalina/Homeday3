class Appointment < ApplicationRecord
  belongs_to :realtor
  belongs_to :seller
  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validate :date_is_not_weekend
  validates :timeslot, presence: true
  belongs_to :realtor
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  def date_is_not_weekend
    if date.present? && date.wday == 6 || date.wday == 0
      errors.add(:date, "can't be on a weekend")
    end
  end

  TIMESLOT = ['08.00 - 08.30', '08.30-09.00', '09.00-09.30', '09.30-10.00', '10.00 - 10.30', '10.30 - 11.00', '11.00 - 11.30', '11.30 - 12.00', '12.00 - 12.30', '12.30 - 13.00', '13.00 - 13.30', '13.30 - 14.00', '14.00 - 14.30', '14.30 - 15.00', '15.00 - 15.30', '15.30 - 16.00', '16.00 - 16.30', '16.30 - 17.00', '17.00 - 17.30', '17.30 - 18.00' ]
end
