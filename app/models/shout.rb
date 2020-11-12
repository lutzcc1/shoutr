class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..161 }
  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end