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
    assert_equal "2 hours and 1 minute and 4 seconds", Taw.time_ago_in_words(Time.now - 60 * 60 * 2 - 64)
  end
end
