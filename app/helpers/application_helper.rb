module ApplicationHelper
  def last_sunday
    now = Time.now
    sunday = now - now.wday.days
    date = "#{sunday.year}-#{sunday.month}-#{sunday.day}"
    date
  end

  def next_sunday 
    now = Time.now
    sunday = now + ( 7 - now.wday ).days
    date = "#{sunday.year}-#{sunday.month}-#{sunday.day}"
    date
  end
end
