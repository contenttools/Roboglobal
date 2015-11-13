class DocumentsController < ApplicationController
  def download_file
    begin
      @file = CGI::unescape Index.pdf_file(params[:index_type], params[:category])
      return (send_file "#{Rails.root}/public" + @file.split("?").first, type: "pdf", x_sendfile: true) unless @file == "#"
      redirect_to eu_index_url
    rescue
      redirect_to eu_index_url
    end
  end
end
