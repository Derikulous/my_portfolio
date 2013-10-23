class Comment < ActiveRecord::Base
  include Rakismet::Model
  belongs_to :commentable, polymorphic: true
  attr_accessible :comment, :approved, :author, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip, :post_id
end
