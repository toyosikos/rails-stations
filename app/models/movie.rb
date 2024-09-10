class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :id, uniqueness: true
    has_many :schedules
    def self.looks(search)
        if search
          where('name LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
        else
          []
        end
      end
end