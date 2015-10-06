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
  scope :asc_ordered, -> { order('blog_posts.created_at ASC') }
  scope :views_ordered, -> { order('blog_posts.views DESC') }
  scope :last_three_month, -> { where("blog_posts.published_date > ?", Date.today - 3.months) }
  scope :by_year_and_month, ->(month, year){ where("year(published_date) = ? and month(published_date) = ? ", year, month) if year.present? && month.present? }

  TOKENS = ['Technology', 'Events', 'Video', 'Healthcare', 'Drones', 'Manufacturing', 'Logistics Automation', 'Remotely Operated Vehicles', 'Self Driving Cars', 'Agriculture', 'Consumer Products', '3D Printing']
  PER_PAGE_RECORDS = 20
  ROBO_NEWS_PER_PAGE_RECORDS = 6

  paginates_per PER_PAGE_RECORDS

  after_initialize :set_content

  def self.archives_list
    hash = BlogPost.group("year(published_date)").group("month(published_date)").count
    hash.present? ? Hash[hash.to_a.reverse] : []
  end

  def set_content
    self.tags ||= []
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def blog_seo_options
    keywords = self.tags.join(", ")
    seo_options = {
      title:       self.title,
      description: ActionView::Base.full_sanitizer.sanitize(self.description),
      keywords:    keywords,
    }

    seo_options[:image] = self.blog_attachement
    seo_options
  end

  def blog_attachement
    if self.embedded_attachment.present?
      self.embedded_attachment.embed_code
    elsif self.attachment.present?
      self.attachment.image.url(:large)
    elsif self.pdf_attachment.present?
      self.pdf_attachment.document.url(:pdf_normal)
    else
      ActionController::Base.helpers.asset_path('/robo_missing_400.jpeg')
    end
  end

  def self.index_seo_options
    seo_options = {
      title:       "Need to Know Robotics and Automation Industry News",
      description: "Keep up with current events and news in robotics and automation",
      image: ActionController::Base.helpers.asset_path("ROBONews.jpg"),
    }
  end

  def next_and_previous_blogs
    next_blog = nil
    previous_blog = nil

    current_date_blogs = BlogPost.where("published_date = ?", self.published_date).asc_ordered

    if current_date_blogs.count > 1
      current_index = current_date_blogs.collect(&:id).index(self.id)

      next_blog = current_date_blogs[current_index + 1]
      previous_blog = current_date_blogs[current_index - 1] if (current_index - 1) >= 0
    end

    if next_blog.blank?
      next_blog = self.get_next_blog
    end

    if previous_blog.blank?
      previous_blog = self.get_previous_blog
    end

    return next_blog, previous_blog
  end

  def get_next_blog
    next_blog = BlogPost.where("published_date > ?", self.published_date).published_ordered.last
  end

  def get_previous_blog
    previous_blog = BlogPost.where("published_date < ?", self.published_date).published_ordered.ordered.first
  end

  def self.latest_blogs(params, token)
    self.includes(:attachment, :pdf_attachment).by_year_and_month(params[:month], params[:year]).where("tags LIKE ?", "%#{token}\n%").published_ordered.ordered.page(params[:page]).per(BlogPost::ROBO_NEWS_PER_PAGE_RECORDS)
  end
end
