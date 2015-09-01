class ContactNotificationMailer < ApplicationMailer
  default from: "admin@robostox.com"
  def contact_notification(contact)
    @contact = contact
    mail to: 'khawar.qayyum@square63.com', subject: "New Contact Request"
  end
end
