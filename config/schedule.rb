require 'active_support/all'

Time.zone = 'Berlin'

every 1.day, :at => Time.zone.parse('22:50 pm').utc do
  runner "IndexRecord.fetch_missing_data", :output => 'cron.log'
end

every 1.day, :at => Time.zone.parse('23:50 pm').utc do
  runner "IndexRecord.fetch_data", :output => 'cron.log'
end
