class Index < ActiveRecord::Base
  has_one :file_correlation, as: :document
  has_one :pdf_attachment, through: :file_correlation, as: :document

  validates :pdf_attachment, presence: true

  scope :category, -> (category) { where(category: category) }
  scope :index_type, -> (type) {where(index_type: type)}

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS
end
