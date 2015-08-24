class FileCorrelation < ActiveRecord::Base
  belongs_to :pdf_attachment
  belongs_to :document, polymorphic: true
end
