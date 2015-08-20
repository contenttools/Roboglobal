class Page < ActiveRecord::Base
  has_one :embedded_attachment, as: :attachable
  validates :title, presence: true

  scope :home,    -> { where(title: 'home').first }
end
