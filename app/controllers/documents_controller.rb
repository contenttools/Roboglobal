class DocumentsController < ApplicationController
  FILE_NAME_MAPPING = {
    "fact_sheet" => ['ROBO_Global_Robotics_and_Automation_UCITS_Index (1).pdf', 'application/pdf'],
    "holdings" => ['Index Methodology 1.4.pdf', 'application/pdf'],
    "classifications" => ['Industry Classification 1.3.pdf','application/pdf'],
  }
  def download_file
    file = FILE_NAME_MAPPING[params[:file_name]]
    if file.present?
      send_file "#{Rails.root}/public/data/#{file[0]}", :type=>"#{file[1]}", :x_sendfile=>true
    else
      render nothing: true
    end
  end
end
