require 'active_support/all'

Time.zone = 'Berlin'

every 1.day, :at => Time.zone.parse('23:50 pm').utc do
  runner "IndexRecord.fetch_data_us", :output => '/logs/cron.log'
end

every 1.day, :at => Time.zone.parse('23:51 pm').utc do
  runner "IndexRecord.fetch_data_eu", :output => '/logs/cron.log'
end
