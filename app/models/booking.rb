class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
end

validates :start_date, :end_date, presence: true

def duration_in_days
  (end_date - start_date).to_i + 1
end
end
