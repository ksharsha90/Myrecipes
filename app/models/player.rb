class Player < ApplicationRecord
  
  validates :name, presence: true, length: {minimun: 3, maximum: 25}
  validates_uniqueness_of :name
  has_many :team_players
  has_many :teams, through: :team_players
  
end