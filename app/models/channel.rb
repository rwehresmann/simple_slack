class Channel < ApplicationRecord
  validates_presence_of :slug, :team, :user
  validates :slug, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_uniqueness_of :slug, scope: :team_id

  belongs_to :team
  belongs_to :user
  has_many :messages, as: :messagable, dependent: :destroy
end
