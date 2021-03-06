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

  def eu_index?
    session[:referrer_index] == "eu"
  end

  def back_path
    if session[:referrer_index] == "eu"
      eu_index_indices_path
    elsif session[:referrer_index] == "us"
      us_index_indices_path
    elsif session[:referrer_index] == "industry_report"
      industry_report_indices_path
    else
      investment_case_indices_path
    end
  end

  def get_button_text
   button_text = @index.persisted? ? "Update " : "Add "
   button_text + @index.index_category
  end

  def get_document_type
    @pdf_attachment.present? ? @pdf_attachment.document_file_name : 'No Document Type Present'
  end

  def display_documnet_preview
    return 'No Document Preview' unless @pdf_attachment.present?

    link_to @pdf_attachment.document.url, target: "_blank" do
      image_tag @pdf_attachment.document.url(:pdf_mini)
    end
  end

  def industry_report?
    session[:referrer_index] == "industry_report"
  end

end
