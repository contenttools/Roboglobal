module PagesHelper
  def blogs_image(blog)
    return blog.attachment.image.url(:thumb) if blog.attachment.present?
    return blog.pdf_attachment.document.url(:pdf_mini) if blog.pdf_attachment.present?
    return '/robo_missing.jpg'
  end

  def blog_description(blog)
    doc = Nokogiri(blog.description.gsub('&nbsp;', ' '))
    truncate(doc.text.squeeze(" "), length: 80)
  end

  def get_us_fact_sheet
    Index.pdf_file("us", "fact_sheet")
  end

  def get_us_index_holdings
    Index.pdf_file("us", "index_holdings")
  end

  def get_us_industry_classification
    Index.pdf_file("us", "industry_classification")
  end

  def get_eu_fact_sheet
    Index.pdf_file("eu", "fact_sheet")
  end

  def get_eu_index_methodology
    Index.pdf_file("eu", "index_methodology")
  end

  def get_eu_industry_classification
    Index.pdf_file("eu", "industry_classification")
  end

  def get_industry_report
    Index.pdf_file("industry_report", "industry_report")
  end

  def get_investment_case
    Index.pdf_file("investment_case", "investment")
  end

  def get_global_presentation
    Index.pdf_file("investment_case", "global_presentation")
  end

  def get_research
    Index.pdf_file("investment_case", "research")
  end
end
