class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :phone, :message
  validates_format_of :email, :with => /@/
end
