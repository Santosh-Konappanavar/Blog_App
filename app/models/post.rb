class NewPost < ApplicationRecord
  belongs_to :author, class_name: 'NewUser', foreign_key: :author_id
  has_many :new_comments
  has_many :new_likes

  def self.update_posts_counter(user_id)
    user = NewUser.find(user_id)
    user.update(posts_counter: user.new_posts.count)
  end

  scope :recent_comments, lambda { |new_post_id|
                            NewComment.where(new_post_id: new_post_id).order(created_at: :desc).limit(5)
                          }
end
