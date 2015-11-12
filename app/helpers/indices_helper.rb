module IndicesHelper
def show_attachment_file_link
    return ' hide' if @current_pdf_attachment.blank? || !(@index.persisted?)
    return ''
  end

  def remove_attachment_route
    return remove_file_index_path(@index) if @index.persisted?
    return '#'
  end

  def get_index_name
    session[:referrer_index].titleize
  end

  def is_us_index?
    session[:referrer_index] == "us"
  end
end
