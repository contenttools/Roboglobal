class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        ContactNotificationMailer.contact_notification(@contact).deliver
        format.html { redirect_to :back, notice: 'Contact request sent.' }
      else
        format.html { redirect_to :back, notice: @contact.errors.full_messages.to_sentence }
      end
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :phone, :email, :message)
    end
end
