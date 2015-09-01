class ContactNotificationMailer < ApplicationMailer
  default from: "admin@robostox.com"
  def contact_notification(contact)
    @contact = contact
    mail to: 'taimur.akhtar@square63.com', subject: "New Contact Request"
  end
end
