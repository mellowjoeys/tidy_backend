module ApplicationHelper
  def last_sunday
    now = Time.now
    sunday = now - now.wday.days
  end

  def next_sunday 
    now = Time.now
    sunday = now + ( 7 - now.wday ).days
  end

  def last_sunday_for_sql
    last_sunday.strftime("%Y-%m-%d")
  end

  def next_sunday_for_sql
    next_sunday.strftime("%Y-%m-%d")
  end

end
