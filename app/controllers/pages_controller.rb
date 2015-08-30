class PagesController < ApplicationController
  def home
    @video = Page.home.embedded_attachment.try(:embed_code)
    @subscriber = Subscriber.new
    @latest_blogs = BlogPost.order("published_date DESC").first(3)
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
