class DocumentsController < ApplicationController
  def download_file
    begin
      @file = CGI::unescape Index.pdf_file(params[:index_type], params[:category])
      return (send_file "#{Rails.root}/public" + @file.split("?").first, type: "pdf", x_sendfile: true) unless @file == "#"
      redirect_to get_redirect_path
    rescue
      redirect_to get_redirect_path
    end
  end

  private
    def get_redirect_path
      return eu_index_url if params[:index_type] == 'eu'
      return us_index_url if params[:index_type] == 'us'
      return investment_case_url
    end
end
