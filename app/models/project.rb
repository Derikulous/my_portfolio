class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used, :image, :remote_image_url
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader
end
