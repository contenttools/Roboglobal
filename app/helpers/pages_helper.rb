module PagesHelper
  def blogs_image(blog)
    return blog.attachment.image.url(:thumb) if blog.attachment.present?
    return '/robo_missing.jpg'
  end

  def blog_description(blog)
    doc = Nokogiri(blog.description.gsub('&nbsp;', ' '))
    truncate(doc.text.squeeze, length: 80)
  end
end
