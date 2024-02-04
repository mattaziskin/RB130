require 'date'

class Meetup
  DAYS = {
    'sunday' => 0,
    'monday' => 1,
    'tuesday' => 2,
    'wednesday' => 3,
    'thursday' => 4,
    'friday' => 5,
    'saturday' => 6
  }.freeze
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    end_date = Date.new(year, month, -1)
    days = (1..end_date.day).select do |d|
      day_match?(Date.new(year, month, d), weekday)
    end
    return nil if schedule == 'fifth' && days.size < 5

    Date.new(year, month, schedule_match(days, schedule.downcase))
  end

  private

  def schedule_match(days, schedule)
    case schedule
    when 'first' then days[0]
    when 'second' then days[1]
    when 'third' then days[2]
    when 'fourth' then days[3]
    when 'fifth' then days[4]
    when 'last' then days[-1]
    when 'teenth' then days.select { |d| d < 20 && d > 12 }[0]
    end
  end

  def day_match?(date, weekday)
    date.wday == DAYS[weekday.downcase]
  end
end
