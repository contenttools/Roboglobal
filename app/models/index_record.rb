class IndexRecord < ActiveRecord::Base
  SERVER = 'icp.structured-solutions.de'
  USERNAME = 'Ahjo7xee'
  PASSWORD = 'ieG7eng5'

  def self.fetch_data
    ftp = connect_ftp

    begin
      ftp.size(file_name)
      ftp.getbinaryfile(file_name)
      index = parse_file_and_return_index
      save_index(index)
      destroy_file
    rescue => e
      puts "Caught exception #{e}!"
    end

    ftp.close
  end

  def self.file_name
    ['Closing_Values_ROBOT_', Date.today.strftime("%Y%m%d"), '.xls'].join
  end

  def self.save_index(current_index)
    ip = IndexRecord.where(value: current_index, index_date: Date.today).first_or_create
  end

  def self.parse_file_and_return_index
    workbook = Spreadsheet.open(file_name)
    sheet = workbook.worksheet(0).to_a
    sheet[1][1]
  end

  def self.destroy_file
    File.delete(file_name)
  end

  def self.connect_ftp
    require 'net/ftp'
    ftp = Net::FTP.new
    ftp.connect(SERVER, 21)
    ftp.login(USERNAME, PASSWORD)
    ftp
  end

end
