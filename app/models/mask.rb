CATEGORIES = ['bear', 'cat', 'dog', 'horse', 'mouse', 'rabbit', 'pig', 'gas']
class Mask < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: :true
  validates :price, presence: :true
  validates :photo, attached: true
  validates :category, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end

