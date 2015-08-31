class BlogPost < ActiveRecord::Base
  extend FriendlyId
  validates :title, uniqueness: true
  validates :title, length: { maximum: 255, message: " with more than 255 characters isn't suitable for a post" }
  validates :title, :published_date , presence: true

  friendly_id :title, use: [:slugged, :finders]
  serialize :tags

  has_one :image_correlation, as: :imageable
  has_one :attachment, through: :image_correlation, as: :imageable
  has_one :file_correlation, as: :document
  has_one :pdf_attachment, through: :file_correlation, as: :document
  has_one :video_correlation, as: :video
  has_one :embedded_attachment, through: :video_correlation, as: :video

  scope :published_ordered, -> { order('blog_posts.published_date DESC') }
  scope :ordered, -> { order('blog_posts.created_at DESC') }

  TOKENS = ['Technology', 'Events', 'Video', 'Healthcare', 'Drones', 'Manufacturing', 'Logistics Automation', 'Remotely Operated Vehicles', 'Self Driving Cars', 'Agriculture', 'Consumer Products', '3D Printing']
  PER_PAGE_RECORDS = 10

  paginates_per PER_PAGE_RECORDS

  after_initialize :set_content

  def self.archives_list
    hash = BlogPost.group("year(published_date)").group("month(published_date)").count
    Hash[hash.to_a.reverse] if hash.present?
  end

  def set_content
    self.tags ||= []
  end
end
