class Attachment < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  has_attached_file :image, :styles => {large: "900x", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes

  def url(*args)
    photo.url(*args)
  end

  def name
    photo_file_name
  end

  def content_type
    photo_content_type
  end

  def file_size
    photo_file_size
  end
end
