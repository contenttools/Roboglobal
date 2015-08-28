class Subscriber < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email

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
