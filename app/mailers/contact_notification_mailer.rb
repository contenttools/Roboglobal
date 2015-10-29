class ContactNotificationMailer < ApplicationMailer
  default from: "admin@robostox.com"
  def contact_notification(contact)
    @contact = contact
    email = root_url.include?('roboglobal.com') ? ['erica@roboglobal.com', 'khawar.qayyum@square63.com'] : ['khawar.qayyum@square63.com', 'hassan.akram@square63.com', 'waleed.nadeem@square63.com']
    mail to: email, subject: "New Contact Request"
  end
end
