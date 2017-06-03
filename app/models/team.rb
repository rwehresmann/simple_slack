class Team < ApplicationRecord
  validates_presence_of :slug
  validates :slug, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  belongs_to :user
  has_many :talks
  has_many :channels, dependent: :destroy
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users

  before_save :create_general_channel

  private

  def create_general_channel
    self.channels << Channel.create(slug: 'general', user_id: self.user.id)
  end
end
