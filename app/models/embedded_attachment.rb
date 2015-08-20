class EmbeddedAttachment < ActiveRecord::Base
  validates :embed_code, presence: true
end
