class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published, :post_id, :image, :remote_image_url
  belongs_to :author, class_name: "User"
  scope :published, where(published: true)
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
