class BlogPost < ActiveRecord::Base
  validates :title, :published_date , presence: true

  serialize :tags

  has_one :image_correlation, as: :imageable
  has_one :attachment, through: :image_correlation, as: :imageable

  TOKENS = ['Technology', 'Events', 'Video', 'Healthcare', 'Drones', 'Manufacturing', 'Logistics Automation', 'Remotely Operated Vehicles', 'Self Driving Cars', 'Agriculture', 'Consumer Products', '3D Printing']
  PER_PAGE_RECORDS = 10

  paginates_per PER_PAGE_RECORDS
end
