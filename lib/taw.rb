require "taw/version"

module Taw
  MINUTE_IN_SECONDS = 60
  HOUR_IN_SECONDS = MINUTE_IN_SECONDS * 60
  DAY_IN_SECONDS = HOUR_IN_SECONDS * 24

  extend self

  def time_ago_in_words(time)
    self.distance = Time.now - time
    calculate_distance
    output_distance
  end

  private

  attr_accessor :hours, :minutes, :seconds, :distance

  def calculate_distance
    while distance > 0
      if distance < MINUTE_IN_SECONDS
        build_seconds
      end

      if distance < HOUR_IN_SECONDS && distance > 0
        build_minutes
      end

      if distance < DAY_IN_SECONDS && distance > 0
        build_hours
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

  def output_distance
    [
      ("#{hours} hours" if hours && hours > 0),
      ("#{minutes} minutes" if minutes && minutes > 0),
      ("#{seconds} seconds" if seconds && seconds > 0)
    ].compact.join(" and ")
  end
end
