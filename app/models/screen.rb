class Screen < ApplicationRecord
    validates :screen_number, presence: true, uniqueness: { scope: %i[theater_id] }
    belongs_to :theater
  end