class NewUser < ApplicationRecord
  has_many :new_likes, foreign_key: :liker_id, dependent: :destroy
  has_many :new_comments, foreign_key: :writer_id, dependent: :destroy
  has_many :new_posts, foreign_key: :author_id, dependent: :destroy

  scope :user_recent_posts, ->(user_id) { find(user_id).new_posts.order(created_at: :desc).limit(3) }
end
