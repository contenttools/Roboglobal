class ContactNotificationMailer < ApplicationMailer
  default from: "admin@robostox.com"
  def contact_notification(contact)
    @contact = contact
    email = Rails.env.production? ? 'erica@roboglobal.com' : 'khawar.qayyum@square63.com'
    mail to: email, subject: "New Contact Request"
  end
end
