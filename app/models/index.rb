class Index < ActiveRecord::Base
  has_one :file_correlation, as: :document
  has_one :pdf_attachment, through: :file_correlation, as: :document

  validates :pdf_attachment, presence: true

  scope :category, -> (category) { where(category: category) }
  scope :index_type, -> (type) {where(index_type: type)}

  def self.pdf_file(type, category)
    self.index_type(type).category(category).last.present? ? self.index_type(type).category(category).last.pdf_attachment.document.url : "#"
  end

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS
end
