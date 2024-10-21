class Theater < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :screens
    has_many :reservation
  end