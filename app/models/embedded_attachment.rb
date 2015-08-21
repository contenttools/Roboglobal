class EmbeddedAttachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  validates :embed_code, presence: true

  PER_PAGE_RECORDS = 10
  paginates_per PER_PAGE_RECORDS
end
