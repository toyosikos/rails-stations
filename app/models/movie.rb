class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :id, uniqueness: true
end