require "taw/version"

module Taw
  MINUTE_IN_SECONDS = 60
  HOUR_IN_SECONDS = MINUTE_IN_SECONDS * 60
  DAY_IN_SECONDS = HOUR_IN_SECONDS * 24
  WEEK_IN_SECONDS = DAY_IN_SECONDS * 7
  MONTH_IN_SECONDS = DAY_IN_SECONDS * 30

  def self.time_ago_in_words(time)
    Calculator.new.time_ago_in_words(time)
  end

  class Calculator
    def time_ago_in_words(time)
      self.distance = Time.now - time
      calculate_distance
      output_distance
    end

    private

    attr_accessor :distance,
      :seconds,
      :minutes,
      :hours,
      :days,
      :weeks,
      :months

    def calculate_distance
      while distance > 0
        if distance < MINUTE_IN_SECONDS
          build_seconds
        elsif distance < HOUR_IN_SECONDS
          build_minutes
        elsif distance < DAY_IN_SECONDS
          build_hours
        elsif distance < WEEK_IN_SECONDS
          build_days
        elsif distance < MONTH_IN_SECONDS
          build_weeks
        else 
          build_months
        end
      end
    end

    def build_seconds
      self.seconds, self.distance = distance.to_i, 0
    end

    def build_minutes
      self.minutes, self.distance = distance.divmod(MINUTE_IN_SECONDS)
    end

    def build_hours
      self.hours, self.distance = distance.divmod(HOUR_IN_SECONDS)
    end

    def build_days
      self.days, self.distance = distance.divmod(DAY_IN_SECONDS)
    end

    def build_weeks
      self.weeks, self.distance = distance.divmod(WEEK_IN_SECONDS)
    end

    def build_months
      self.months, self.distance = distance.divmod(MONTH_IN_SECONDS)
    end

    def output_distance
      [
        ("#{months} #{pluralize(months, "month", "months")}" if months && months > 0),
        ("#{weeks} #{pluralize(weeks, "week", "weeks")}" if weeks && weeks > 0),
        ("#{days} #{pluralize(days, "day", "days")}" if days && days > 0),
        ("#{hours} #{pluralize(hours, "hour", "hours")}" if hours && hours > 0),
        ("#{minutes} #{pluralize(minutes, "minute", "minutes")}" if minutes && minutes > 0),
        ("#{seconds} #{pluralize(seconds, "second", "seconds")}" if seconds && seconds > 0)
      ].compact.join(" and ")
    end

    def pluralize(count, singular, plural)
      count > 1 ? plural : singular
    end
  end
end
