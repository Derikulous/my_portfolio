class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published, :post_id, :image, :remote_image_url
  belongs_to :admin, class_name: "User"
  scope :published, where(published: true)
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == admin
  end
end
