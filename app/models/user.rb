class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  validates :name, presence: true
  validates :name, presence: true, length: { in: 3..25 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
    validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
end
