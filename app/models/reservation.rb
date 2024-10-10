class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :sheet
    belongs_to :movie
    validates :email, presence: true
    validates :date, uniqueness: { scope: %i[schedule_id sheet_id date screen_id theater_id] }

    
end