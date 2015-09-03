class PageEmbed < ActiveRecord::Base
  validates_presence_of :title, :embed_code
  validates :title, length: { maximum: 255, message: " with more than 255 characters isn't suitable for a title" }


  def self.home_page_embed_video
    where(role: 'home_embedded_video').first.embed_code
  end

  def self.robo_news_embed_video
    where(role: 'robo_news_embedded_video').first.embed_code
  end

  def self.home_page_stock_charts
    where(role: 'home_embedded_stock_chart').first.embed_code
  end
end
