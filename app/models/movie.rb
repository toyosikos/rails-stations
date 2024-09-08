class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :id, uniqueness: true
    scope :search, -> (query) {
        where("name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%") if query.present?
      }
end