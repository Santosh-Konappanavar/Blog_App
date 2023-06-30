class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counters, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter
  after_destroy :update_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def likes_count
    likes.count
  end

  def comments_count
    comments.count
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
