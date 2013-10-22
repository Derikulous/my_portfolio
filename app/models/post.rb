class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published
  belongs_to :author, class_name: "User"
  scope :published, where(published: true)
  has_many :comments

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
