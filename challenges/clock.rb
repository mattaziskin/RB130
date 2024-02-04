require 'pry'

class Clock
  attr_accessor :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(set_hour, set_minute=0)
    Clock.new(set_hour, set_minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def +(num)
    hours, minutes = num.divmod(60)

    Clock.new((hour + hours) % 24, (minute + minutes) % 60)
  end

  def -(num)
    hours, minutes = num.divmod(60)
    hours = hours % 24
    if (minute-minutes).negative?
      hours += 1
      minute_delta = (minute-minutes) + 60
    else
      minute_delta = minute - minutes
    end
    hour_delta = hour_subtract(hour, hours)
    Clock.new(hour_delta, minute_delta)
  end

  def hour_subtract(start_hour, subtract_hours)
    if (start_hour - subtract_hours).negative?
      hour_delta = (start_hour-subtract_hours) + 24
    else
      hour_delta = start_hour - subtract_hours
    end
    hour_delta
  end

  def to_s
    format("%02d", hour) + ":" + format("%02d", minute)
  end
end

b = Clock.at(10)

puts b-90