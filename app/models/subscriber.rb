class Subscriber < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})/i

  def self.to_csv
    column_names = %w{id email created_at}
    headers = ["Id", "Email", "Created At"]

    CSV.generate(headers: true) do |csv|
      csv << headers

      all.each do |subscriber|
        csv << subscriber.attributes.values_at(*column_names)
      end
    end
  end
end
