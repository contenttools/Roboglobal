class PdfAttachment < ActiveRecord::Base
  belongs_to :document, :polymorphic => true

  has_attached_file :document, :styles => {:pdf_mini => ["100x100#", :png]}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :document, :content_type => ["application/pdf", "application/x-pdf"]
  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 5.megabytes

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
