class BlogPost < ActiveRecord::Base
  validates :title, :published_date , presence: true

  serialize :tags

  TOKENS = ['Technology', 'Events', 'Video', 'Healthcare', 'Drones', 'Manufacturing', 'Logistics Automation', 'Remotely Operated Vehicles', 'Self Driving Cars', 'Agriculture', 'Consumer Products', '3D Printing']
  PER_PAGE_RECORDS = 10

  paginates_per PER_PAGE_RECORDS
end
