class ImageCorrelation < ActiveRecord::Base
  belongs_to :attachment
  belongs_to :imageable, polymorphic: true
end
