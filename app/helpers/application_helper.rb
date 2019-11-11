module ApplicationHelper
  def two_sundays_ago
    now = Time.now
    sunday = now - now.wday.days - 7.days
  end

  def last_sunday #today
    now = Time.now
    sunday = now - now.wday.days
  end

  def next_sunday #next sunday
    now = Time.now
    sunday = now + ( 7 - now.wday ).days
  end

  def two_sundays_ago_for_sql
    two_sundays_ago.strftime("%Y-%m-%d")
  end

  def last_sunday_for_sql
    last_sunday.strftime("%Y-%m-%d")
  end

  def next_sunday_for_sql
    next_sunday.strftime("%Y-%m-%d")
  end

end
