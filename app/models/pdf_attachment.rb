class PdfAttachment < ActiveRecord::Base
  has_many :file_correlations
  has_many :blog_posts, :through => :file_correlations, :source => :document, :source_type => 'BlogPost'
  has_many :indices, :through => :file_correlations, :source => :document, :source_type => 'Index'

  has_attached_file :document, :styles => {:pdf_mini => ["100x100#", :png], :pdf_normal => ["400x400#", :png]}, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :document, :message => "Invalid kindly attach PDF file", :content_type => ["application/pdf", "application/x-pdf", "application/octet-stream"]

  validates_attachment_presence :document
  validates_attachment_size :document, less_than: 50.megabytes

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS

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
