module BlogPostsHelper
  def show_remove_attachment_link
    return ' hide' if @current_attachment.blank? || !(@blog_post.persisted?)
    return ''
  end

  def remove_image_route
    return remove_image_blog_post_path(@blog_post) if @blog_post.persisted?
    return '#'
  end

  def show_file_attachment_link
    return ' hide' if @current_pdf_attachment.blank? || !(@blog_post.persisted?)
    return ''
  end

  def remove_file_route
    return remove_file_blog_post_path(@blog_post) if @blog_post.persisted?
    return '#'
  end

  def show_video_attachment_link
    return ' hide' if @current_embedded_attachment.blank? || !(@blog_post.persisted?)
    return ''
  end

  def remove_video_route
    return remove_video_blog_post_path(@blog_post) if @blog_post.persisted?
    return '#'
  end

  def robo_news_blog_title(blog, length)
    truncate(blog.title, length: length, separator: ' ')
  end

  def robo_news_blog_description(blog)
    doc = Nokogiri(blog.description.gsub('&nbsp;', ' '))
    truncate(doc.text.squeeze(" "), length: 300)
  end

  def robo_news_blog_attachment(blog)
    return raw("#{blog.embedded_attachment.embed_code}") if blog.embedded_attachment.present?
    return image_tag("#{blog.attachment.image.url(:medium)}") if blog.attachment.present?
    return image_tag("#{blog.pdf_attachment.document.url(:pdf_normal)}") if blog.pdf_attachment.present?
    return image_tag('/robo_missing_400.jpeg')
  end
end
