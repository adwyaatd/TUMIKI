module ApplicationHelper
 def simple_time(time)
  time.to_time.to_s(:db)
 end

end
