require_relative "test_helper"

class TawTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Taw::VERSION
  end

  def test_it_returns_hours
    assert_equal "2 hours", Taw.time_ago_in_words(Time.now - 60 * 60 * 2)
  end

  def test_it_returns_second_when_applicable
    assert_equal "2 minutes and 3 seconds", Taw.time_ago_in_words(Time.now - 123)
  end

  def test_it_returns_singulars
    assert_equal "1 minute and 1 second", Taw.time_ago_in_words(Time.now - 61)
  end

  def test_it_returns_mixed_stuff
    assert_equal "1 day and 2 hours and 1 minute and 4 seconds", Taw.time_ago_in_words(Time.now - 60 * 60 * 26 - 64)
  end

  def test_approximation_to_one_unit
    assert_equal "1 day", Taw.time_ago_in_words(Time.now - 60 * 60 * 26 - 64, approx: 1)
  end

  def test_approximation_to_two_units
    assert_equal "1 day and 2 hours", Taw.time_ago_in_words(Time.now - 60 * 60 * 26 - 64, approx: 2)
  end

  def test_approximation_rounds_down
    assert_equal "2 hours and 59 minutes", Taw.time_ago_in_words(Time.now - 60 * 60 * 3 + 1, approx: 2)
  end

  def test_approximation_does_not_skip_units
    # Don't say 1 month and 1 minute because the minute is insignificant
    assert_equal "1 month", Taw.time_ago_in_words(Time.now - 60 * 60 * 24 * 30 - 60, approx: 2)
  end

  def test_it_returns_days
    assert_equal "2 days", Taw.time_ago_in_words(Time.now - 60 * 60 * 24 * 2)
  end

  def test_it_returns_weeks
    assert_equal "2 weeks", Taw.time_ago_in_words(Time.now - 60 * 60 * 24 * 14)
  end

  def test_it_returns_months
    assert_equal "2 months", Taw.time_ago_in_words(Time.now - 60 * 60 * 24 * 60)
  end

  def test_it_returns_years
    assert_equal "1 year", Taw.time_ago_in_words(Time.now - 60 * 60 * 24 * 30 * 12)
  end
end
