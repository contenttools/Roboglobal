class EmbeddedAttachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  validates :embed_code, presence: true
end
