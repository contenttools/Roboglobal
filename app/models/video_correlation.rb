class VideoCorrelation < ActiveRecord::Base
  belongs_to :embedded_attachment
  belongs_to :video, polymorphic: true
end
