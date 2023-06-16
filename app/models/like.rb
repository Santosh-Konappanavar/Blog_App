class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  after_create :update_likes_counter
  after_destroy :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
