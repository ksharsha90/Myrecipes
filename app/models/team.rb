class Team < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  
  belongs_to :rowdie
  validates :rowdie_id, presence: true
end