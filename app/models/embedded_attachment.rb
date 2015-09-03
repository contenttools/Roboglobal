class EmbeddedAttachment < ActiveRecord::Base
  has_many :video_correlations
  has_many :blog_posts, :through => :video_correlations, :source => :video, :source_type => 'BlogPost'

  validates :embed_code, presence: true

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS
end
