class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :id, uniqueness: true
    def self.looks(search)
        if search
          where('name LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
        else
          []
        end
      end
end