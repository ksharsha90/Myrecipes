class Comment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 4, maximun: 140 }
  belongs_to :rowdie
  belongs_to :team
  validates :rowdie_id, presence: true
  validates :team_id, presence: true
  default_scope -> { order(updated_at: :desc)}
end