class NewComment < ApplicationRecord
  belongs_to :writer, class_name: 'NewUser', foreign_key: :writer_id
  belongs_to :new_post

  def self.update_comment_counter(new_post_id)
    new_post = NewPost.find(new_post_id)
    new_post.update(comment_counter: new_post.new_comments.count)
  end
end
