class Schedule < ApplicationRecord
    belongs_to :movie, optional: true
    has_many :reservations
  
    def display_time
      "#{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')}"
    end
  end