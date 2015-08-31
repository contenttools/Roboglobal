class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)
    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to :back, notice: 'Subscriber successfully Added' }
        format.js
      else
        format.html { redirect_to :back, notice: @subscriber.errors.full_messages.to_sentence }
        format.js
      end
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
