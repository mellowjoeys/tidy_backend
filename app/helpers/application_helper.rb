module ApplicationHelper
  def last_sunday
    now = Time.now
    now - now.wday.days
  end

  def next_sunday
    now = Time.now
    now + ( 7 - now.wday ).days
  end
end
