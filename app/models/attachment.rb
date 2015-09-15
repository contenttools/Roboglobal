class Attachment < ActiveRecord::Base
  has_many :image_correlations
  has_many :blog_posts, :through => :image_correlations, :source => :imageable, :source_type => 'BlogPost'

  has_attached_file :image, :styles => {large: "900x", medium: "409x287!", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS

  VALID_ATTACHABLE_TYPE = ["BlogPost", "Page"]

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
