class Team < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  
  belongs_to :rowdie
  validates :rowdie_id, presence: true 
  default_scope -> { order(updated_at: :desc)}
  has_many :team_players
  has_many :players, through: :team_players
end