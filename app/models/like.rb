class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :user, class_name: 'User'
  after_create :update_likes_counter
  after_destroy :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counters)
  end
end
