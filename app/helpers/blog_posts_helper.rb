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
end
