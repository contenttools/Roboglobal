class ContactNotificationMailer < ApplicationMailer
  default from: "admin@robostox.com"
  def contact_notification(contact)
    @contact = contact
    email = ['erica@roboglobal.com']
    mail to: email, subject: "New Contact Request"
  end
end
