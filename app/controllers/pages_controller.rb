class PagesController < ApplicationController

  before_filter :set_seo_options

  SEO_OPTIONS = {
    "home" => {
      title:       "ROBO Global",
    },

    "about_us" => {
      title:       "ABOUT US",
    },

    "us_index" => {
      title:       "ROBO US INDEX",
    },

    "eu_index" => {
      title:       "ROBO EU INDEX",
    },

    "legal_information" => {
      title:       "LEGAL INFORMATION",
    },
  }

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

  def set_seo_options
    prepare_meta_tags(SEO_OPTIONS[params[:action]])
  end

end
