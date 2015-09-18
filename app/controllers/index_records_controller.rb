class IndexRecordsController < ApplicationController
  def stock_chart_data
    render json: IndexRecord.stock_chart_data(params[:type])
  end
end
