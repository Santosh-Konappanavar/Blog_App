class NewLike < ApplicationRecord
  belongs_to :liker, class_name: 'NewUser', foreign_key: :liker_id
  belongs_to :new_post

  def self.update_post_likes(new_post_id)
    new_post = NewPost.find(new_post_id)
    new_post.update(likes_counter: new_post.new_likes.count)
  end
end
