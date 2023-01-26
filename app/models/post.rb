
# rubocop:disable all
# frozen_string_literal: true

class Post < ApplicationRecord
    has_many :likes
    has_many :comments
    belongs_to :user, class_name: "User"
    
  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
# rubocop:enable all