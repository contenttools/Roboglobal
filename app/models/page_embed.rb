class PageEmbed < ActiveRecord::Base
  validates_presence_of :title
  validates :title, length: { maximum: 255, message: " with more than 255 characters isn't suitable for a title" }


  def self.home_page_embed_video
    where(role: 'embed_video_on_home').first.embed_code
  end

  def self.robo_news_embed_video
    where(role: 'embed_video_on_robo_news').first.embed_code
  end

  def self.home_page_stock_charts
    where("role IN (?) AND embed_code IS NOT NULL", ['embed_stock_chart_on_home_1', 'embed_stock_chart_on_home_2', 'embed_stock_chart_on_home_3'])
  end

  def self.robo_news_twitter_feed
    where(role: 'twitter_widget').first.embed_code
  end
end
