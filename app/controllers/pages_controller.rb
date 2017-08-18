class PagesController < ApplicationController

  before_filter :set_seo_options, only: [:home, :about_us, :legal_information, :us_index, :eu_index, :stock_picking_challenge, :industry_report, :investment_case, :disclaimer, :iosco]

  SEO_OPTIONS = {
    "home" => {
      title:       "ROBO Global: The Leading Robotics and Automation Index for Investors",
      description: "ROBO Global: tracking robotics, automation, and enabling technology stocks",
      image: '/index.jpg',
    },

    "about_us" => {
      title:       "ROBO Global: Financial and Robotics Experts",
      description: "Team of ROBO advisors",
      image: "/OurTeam.jpg",
    },

    "us_index" => {
      title:       "ROBO Global: Tracking the Global Growth of the Investable Robotics Market",
      description: "Global stock portfolio for 3d printing, drones, energy, healthcare, technology and manufacturing",
      image: '/index.jpg',
    },

    "eu_index" => {
      title:       "ROBO Global: Tracking the Global Growth of the Investable Robotics Market",
      description: "Global stock portfolio for 3d printing, drones, energy, healthcare, technology and manufacturing",
      image: '/index.jpg',
    },

    "legal_information" => {
      title:       "Legal Information",
      description: "Redistribution, reproduction and/or photocopying in whole or in part are prohibited without written permission. This document does not constitute an offer of services in jurisdictions where ROBO Global does not have the necessary licenses.",
      image: "/index.jpg",
    },

    "stock_picking_challenge" => {
      title:       "ROBO Global: Robotics Stock Picking Contest",
      description: "Win a free drone from ROBO by choosing a portfolio of robotics and automation stocks",
      image: "/index.jpg",
    },

    "industry_report" => {
      title: "ROBO Industry Report"
    },

    "investment_case" => {
      title: "ROBO Global: Tracking the Global Growth of the Investable Robotics Market",
      description: "Global stock portfolio for 3d printing, drones, energy, healthcare, technology and manufacturing",
      image: '/index.jpg',
    },

    "disclaimer" => {
      title: "Disclaimer",
      image: '/index.jpg',
    },

    'iosco' => {
      title: 'IOSCO',
      image: '/index.jpg',
    },
  }

  def home
    @video = PageEmbed.home_page_embed_video
    @subscriber = Subscriber.new
    @latest_blogs = BlogPost.includes(:attachment, :pdf_attachment).published_ordered.ordered.first(3)
    @contact = Contact.new
  end

  def about_us
  end

  def legal_information
  end

  def us_index
    @stock_charts = PageEmbed.home_page_stock_charts
  end

  def eu_index
    @stock_charts = PageEmbed.home_page_stock_charts
  end

  def stock_picking_challenge
    @stock_challenge = PageEmbed.stock_picking_challenge
  end

  def set_seo_options
    @page_title = SEO_OPTIONS[params[:action]][:title]
    prepare_meta_tags(SEO_OPTIONS[params[:action]])
  end

  def investment_case
  end
end
