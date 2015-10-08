class IndexRecord < ActiveRecord::Base
  SERVER = 'icp.structured-solutions.de'
  USERNAME = 'Ahjo7xee'
  PASSWORD = 'ieG7eng5'

  def self.fetch_missing_data
    ftp = connect_ftp
    missing_records = IndexRecord.where("value IS NULL AND index_date > ?", 2.weeks.ago)
    missing_records.each do |record|
      begin
        type = file_type(record.record_type)
        missing_file_name = file_name(type, record.index_date.strftime("%Y%m%d"))
        ftp.size(missing_file_name)
        ftp.getbinaryfile(missing_file_name)
        index = parse_file_and_return_index(missing_file_name)
        if !!Float(index)
          record.update(value: index)
        end
        destroy_file(missing_file_name)
      rescue => e
        puts "Caught exception #{e}!"
      end
    end

    ftp.close
  end

  def self.file_type(type)
    type == 'eu' ? "PR_" : "R_"
  end

  def self.fetch_data
    ftp = connect_ftp
    ['eu', 'us'].each do |type|
      begin
        file_last_part = file_type(type)
        file = file_name(file_last_part)
        ftp.size(file)
        ftp.getbinaryfile(file)
        index = parse_file_and_return_index(file)
        if !!Float(index)
          save_index(index, type)
        end
        destroy_file(file)
      rescue => e
        unless Date.today.wday == 6 || Date.today.wday == 0
          IndexRecord.where(index_date: Date.today, record_type: type).first_or_create
        end
        puts "Caught exception #{e}!"
      end
    end
    ftp.close
  end

  def self.file_name(type, date = Date.today.strftime("%Y%m%d"))
    ['Closing_Values_ROBOT', type, date, '.xls'].join
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
    IndexRecord.where(record_type: record_type).where.not(value: nil).order("index_date ASC").pluck(:value, :index_date).each_cons(2).collect {|record|   {x: record[1][1].to_datetime.to_i*1000, y: record[0][0].to_f, percentage: ((record[0][0].to_f - record[1][0].to_f)/record[1][0].to_f).round(4)}}
  end
end
