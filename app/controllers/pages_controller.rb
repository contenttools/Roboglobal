class PagesController < ApplicationController

  before_filter :set_seo_options, only: [:home, :about_us, :legal_information, :us_index, :eu_index, :stock_picking_challenge]

  SEO_OPTIONS = {
    "home" => {
      title:       "ROBO Global",
      image: '/index-banner.jpg',
    },

    "about_us" => {
      title:       "About Us",
      image: "/about-banner.jpg",
    },

    "us_index" => {
      title:       "ROBO US Index",
      image: '/index-banner.jpg',
    },

    "eu_index" => {
      title:       "ROBO EU Index",
      image: '/index-banner.jpg',
    },

    "legal_information" => {
      title:       "Legal Information",
      image: "/about-banner.jpg",
    },

    "stock_picking_challenge" => {
      title:       "Stock Challenge",
      image: "/about-banner.jpg",
    },
  }

  def home
    @video = PageEmbed.home_page_embed_video
    @stock_charts = PageEmbed.home_page_stock_charts
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
    @page_title = SEO_OPTIONS[params[:action]][:title]
    prepare_meta_tags(SEO_OPTIONS[params[:action]])
  end

end
