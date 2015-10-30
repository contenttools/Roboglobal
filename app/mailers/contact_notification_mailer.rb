class ContactNotificationMailer < ApplicationMailer
  default from: "admin@roboglobal.com"
  def contact_notification(contact)
    @contact = contact
    email = ['erica@roboglobal.com', 'research@roboglobal.com']
    mail to: email, subject: "New Contact Request"
  end
end
