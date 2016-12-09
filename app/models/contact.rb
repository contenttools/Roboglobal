class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validates_format_of :email, :with => /([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})/i
end
