class DocumentsController < ApplicationController
  def download_file
    @file = Index.pdf_file(params[:index_type], params[:category])
    unless @file == "#"
      send_file "#{Rails.root}/public" + @file.split("?").first, type: "pdf", x_sendfile: true
    else
      redirect_to eu_index_url
     end
  end
end
