class Comment < ActiveRecord::Base
  include Rakismet::Model
  belongs_to :commentable, polymorphic: true
  attr_accessible :commentable, :commentable_id, :comment, :approved, :author, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip, :post_id

  def authored_by?(user)
    author == user
  end
end
