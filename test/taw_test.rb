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

  def test_approximation_is_reasonably_short
    assert_equal "1 day and 2 hours", Taw.approx_time_ago_in_words(Time.now - 60 * 60 * 26 - 64)
  end

  def test_approximation_rounds_down
    assert_equal "2 hours and 59 minutes", Taw.approx_time_ago_in_words(Time.now - 60 * 60 * 3 + 1)
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
