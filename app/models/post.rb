class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :comments
  has_many :likes

  after_save :update_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_counter
    author.increment!(:post_counter)
  end
end
