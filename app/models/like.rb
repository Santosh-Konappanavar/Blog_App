class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :user, class_name: 'User'
  after_create :update_likes_counter
  after_destroy :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_counters: post.likes.count)
  end
end
