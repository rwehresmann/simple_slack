class TeamUser < ApplicationRecord
  validates_presence_of :team, :user
  validates_uniqueness_of :user_id, scope: :team_id

  belongs_to :team
  belongs_to :user
end
