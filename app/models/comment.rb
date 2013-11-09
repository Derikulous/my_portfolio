class Comment < ActiveRecord::Base
  include Rakismet::Model
  validates :author, presence: true
  validates :author_email, presence: true
  validates :author_url, presence: true
  belongs_to :commentable, polymorphic: true
  scope :approved, where(approved: true)
  attr_accessible :commentable,
                  :commentable_id,
                  :comment,
                  :approved,
                  :author,
                  :author_email,
                  :author_url,
                  :content,
                  :referrer,
                  :user_agent,
                  :user_ip,
                  :post_id

  def authored_by?(user)
    author == user
  end

  def approve!
    approved = true
    save!
  end
end
