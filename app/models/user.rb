class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  def recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
  validates :Name, presence: true, length: { in: 6..25 }
  validates :PostsCounter, presence: true, length: { in: 0..10 }, numericality: { only_integer: true }
end
