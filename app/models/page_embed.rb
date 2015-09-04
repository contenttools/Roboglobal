class PageEmbed < ActiveRecord::Base
  validates_presence_of :title
  validates :title, length: { maximum: 255, message: " with more than 255 characters isn't suitable for a title" }


  def self.home_page_embed_video
    where(role: 'home_embedded_video').first.embed_code
  end

  def self.robo_news_embed_video
    where(role: 'robo_news_embedded_video').first.embed_code
  end

  def self.home_page_stock_chart
    where(role: 'home_embedded_stock_chart').first.embed_code
  end

  def self.robo_news_twitter_feed
    where(role: 'robo_news_twitter_feed').first.embed_code
  end
end
