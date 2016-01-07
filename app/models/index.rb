class Index < ActiveRecord::Base
  has_one :file_correlation, as: :document
  has_one :pdf_attachment, through: :file_correlation, as: :document

  validates :pdf_attachment, presence: true

  scope :category, -> (category) { where(category: category) }
  scope :index_type, -> (type) {where(index_type: type)}

  def self.pdf_file(type, category)
    latest_index = Index.index_type(type).category(category).includes(:file_correlation).where.not('file_correlations.pdf_attachment_id' => nil).last
    (latest_index.present? && latest_index.pdf_attachment.present?) ? latest_index.pdf_attachment.document.url : "#"
  end

  def index_category
    self.category.titleize
  end

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS
end
