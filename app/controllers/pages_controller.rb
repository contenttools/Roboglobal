class PagesController < ApplicationController
  def home
    @video = Page.home.embedded_attachment.try(:embed_code)
    @subscriber = Subscriber.new
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
