class BlogPost < ActiveRecord::Base
  validates :title, :published_date , presence: true

  serialize :tags

  has_one :image_correlation, as: :imageable
  has_one :attachment, through: :image_correlation, as: :imageable
  has_one :file_correlation, as: :document
  has_one :pdf_attachment, through: :file_correlation, as: :document
  has_one :video_correlation, as: :video
  has_one :embedded_attachment, through: :video_correlation, as: :video

  TOKENS = ['Technology', 'Events', 'Video', 'Healthcare', 'Drones', 'Manufacturing', 'Logistics Automation', 'Remotely Operated Vehicles', 'Self Driving Cars', 'Agriculture', 'Consumer Products', '3D Printing']
  PER_PAGE_RECORDS = 10

  paginates_per PER_PAGE_RECORDS
end
