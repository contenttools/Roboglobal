class IndexRecord < ActiveRecord::Base
  SERVER = 'icp.structured-solutions.de'
  USERNAME = 'Ahjo7xee'
  PASSWORD = 'ieG7eng5'


  def self.fetch_data_eu
    ftp = connect_ftp

    begin
      ftp.size(file_name_eu)
      ftp.getbinaryfile(file_name_eu)
      index = parse_file_and_return_index(file_name_eu)
      save_index(index, 'eu')
      destroy_file(file_name_eu)
    rescue => e
      puts "Caught exception #{e}!"
    end

    ftp.close
  end

  def self.fetch_data_us
    ftp = connect_ftp

    begin
      ftp.size(file_name)
      ftp.getbinaryfile(file_name)
      index = parse_file_and_return_index(file_name)
      save_index(index, 'us')
      destroy_file(file_name_us)
    rescue => e
      puts "Caught exception #{e}!"
    end

    ftp.close
  end

  def self.file_name
    ['Closing_Values_ROBOT_', Date.today.strftime("%Y%m%d"), '.xls'].join
  end

  def self.file_name_eu
    ['Closing_Values_ROBOTPR_', Date.today.strftime("%Y%m%d"), '.xls'].join
  end

  def self.save_index(current_index, type)
    IndexRecord.where(value: current_index, index_date: Date.today, record_type: type).first_or_create
  end

  def self.parse_file_and_return_index(file)
    workbook = Spreadsheet.open(file)
    sheet = workbook.worksheet(0).to_a
    sheet[1][1]
  end

  def self.destroy_file(file)
    File.delete(file)
  end

  def self.connect_ftp
    require 'net/ftp'
    ftp = Net::FTP.new
    ftp.connect(SERVER, 21)
    ftp.login(USERNAME, PASSWORD)
    ftp.passive = true
    ftp
  end

  def self.stock_chart_data(record_type)
    return unless record_type.in? ["us", "eu"]
    IndexRecord.where(record_type: record_type).order("index_date ASC").pluck(:value, :index_date).each_cons(2).collect {|record|   {x: record[0][1].to_datetime.to_i*1000, y: record[0][0].to_f, percentage: ((record[0][0].to_f - record[1][0].to_f)/record[1][0].to_f).round(4)}}
  end
end
