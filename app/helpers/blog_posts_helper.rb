module BlogPostsHelper
  def show_remove_attachment_link
    return ' hide' if @current_attachment.blank? || !(@blog_post.persisted?)
    return ''
  end

  def remove_image_route
    return remove_image_blog_post_path(@blog_post) if @blog_post.persisted?
    return '#'
  end
end
