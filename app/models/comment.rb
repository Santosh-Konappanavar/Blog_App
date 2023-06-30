class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  after_create :update_comments_counter
  after_destroy :update_comments_counter_destroy

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def update_comments_counter_destroy
    post.decrement!(:comments_counter)
  end
end
