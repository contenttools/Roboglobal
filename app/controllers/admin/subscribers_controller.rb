class Admin::SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
    respond_to do |format|
      format.csv { send_data @subscribers.to_csv, filename: "subscribers-#{Date.today}.csv" }
    end
  end
end
