require 'active_support/all'

set :output, "/logs/cron_log.log"

Time.zone = 'Berlin'

every 1.day, :at => Time.zone.parse('23:50 pm').utc do
  runner "IndexRecord.fetch_data"
end
