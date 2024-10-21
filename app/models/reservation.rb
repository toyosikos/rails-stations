class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :sheet
    belongs_to :movie, optional: true
    
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
    validates :date, presence: true, uniqueness: { scope: %i[schedule_id sheet_id screen_id theater_id],
                              message: '指定されたスケジュールで既に予約が存在します。' }
  
    validates :schedule_id, presence: true
    validates :sheet_id, presence: true
  end
  