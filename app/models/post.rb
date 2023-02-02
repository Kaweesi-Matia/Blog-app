class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def all_comments
    comments.order(created_at: :desc)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
  validates :Title, presence: true, length: { in: 6..250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true }
  validates :likes_counter, presence: true, numericality: { only_integer: true }
end
