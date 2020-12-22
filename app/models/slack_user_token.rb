class SlackUserToken < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :access_token, presence: true
end
