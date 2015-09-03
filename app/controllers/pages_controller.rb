class PagesController < ApplicationController
  def home
    @video = PageEmbed.home_page_embed_video
    @stock_chart = PageEmbed.home_page_stock_chart
    @subscriber = Subscriber.new
    @latest_blogs = BlogPost.includes(:attachment, :pdf_attachment).published_ordered.ordered.first(3)
    @contact = Contact.new
  end

  def about_us
  end

  def legal_information
  end

  def us_index
  end

  def eu_index
  end
end
