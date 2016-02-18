module ApplicationHelper
  
  def time_formatter(time)
    time.strftime("%A, %b %d")
  end
end
