require 'minitest/autorun'
require_relative 'prospector'
# Class that tests Prospector class
class ProspectorTest < Minitest::Test
  # UNIT TESTS FOR METHOD random_number(seed, range) in Prospector Class
  # Equivalence classes:
  # seed = -INFINITY..INFINITY -> returns pseudorandom number, that will always be the
  # same for the same seed


  # Test that integer seed returns a random number.
  # Should return the same random number when run multiple times with
  # The same seed.
  def test_random_number_passed
    seed = 1
    range = 8
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    first_run = joe.random_number(seed, range)
    assert_equal first_run, joe.random_number(seed, range)
  end

  # UNIT TESTS FOR METHOD mine(iteration,location,) in Prospector Class
  # Equivalence classes:
  # iteration = -INFINITY..-1 -> returns nil
  # iteration = 1..INFINITY -> returns 1, and mining goes as expected
  # iteration = 0 -> returns 1, and mining goes as expected
  # location = -INFINITY..-1 -> returns nil
  # location = 0..6 -> returns 1, and mining goes as expected
  # location = 7..INFINITY -> returns nil, and mining goes as expected

  # Tests that negative itetation returns nil
  # EDGE CASE
  def test_negative_iteration_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_nil joe.mine(-1, 1)
  end

  # Tests that 0 itetation returns 1
  # EDGE CASE
  def test_zero_iteration_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, joe.mine(0, 1)
  end

  # Tests that valid iteration returns 1
  def test_iteration_mine_passes_less_than_four
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, joe.mine(2, 1)
  end

  # Tests that negative location value returns nil
  # EDGE CASE
  def test_negative_location_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_nil joe.mine(1, -1)
  end

  # Tests that 0 location value returns 1
  # EDGE CASE
  def test_zero_location_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, joe.mine(1, 0)
  end

  # Tests that 7 location value returns nil
  # EDGE CASE
  def test_seven_location_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_nil joe.mine(1, 7)
  end

  # Tests that 6 location value returns 1
  # EDGE CASE
  def test_seven_location_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, joe.mine(1, 6)
  end

  # Tests that valid location value returns 1
  def test_passes_location_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, joe.mine(1, 4)
  end


  # UNIT TESTS FOR METHOD next_location(current_location,seed,id) in Prospector Class
  # Equivalence classes:
  # current_location = -INFINITY..-1 -> returns nil
  # current_location = 0..6 -> returns next location location
  # current_location = 7..INFINITY -> returns nil
  # seed = -INFINITY..INFINITY -> returns next location location

  # Test negative input for current_location
  # EDGE CASE
  def test_next_location_negative_location
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_location_index(_param)
      nil
    end
    assert_nil joe.next_location(-1, 1, 1)
  end

  # Test invalid input = 7 for current_location
  # EDGE CASE
  def test_next_location_invalid_location_seven
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_location_index(_param)
      nil
    end
    assert_nil joe.next_location(7, 1, 1)
  end

  # Test invalid input > 7 for current_location
  def test_next_location_invalid_location
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_location_index(_param)
      nil
    end
    assert_nil joe.next_location(10, 1, 1)
  end

  # Test valid input for current_location
  def test_next_location_valid_location
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_location_index(_param)
      3
    end
    assert_includes [0, 1, 2, 3, 4, 5, 6], joe.next_location(0, 1, 1)
  end


  # UNIT TESTS FOR METHOD set_ruby_chart in Prospector Class
  # Equivalence classes:
  # Should ALWAYS return 2D Array [[1, 1], [2, 2], [1, 1], [3, 0], [0, 3], [2, 2], [2, 2]]

  def test_set_ruby_chart
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal [[1, 1], [2, 2], [1, 1], [3, 0], [0, 3], [2, 2], [2, 2]], joe.set_ruby_chart
  end


  # UNIT TESTS FOR METHOD see_results(prospector) in Prospector Class
  # Equivalence classes:
  # prospector = -INFINITY..-1 -> returns nil
  # prospector = 0 -> returns nil
  # prospector = (Not a number)) -> returns nil
  # prospector = 0..INFINITY  -> returns results in form of string

  # Tests negative input for prospector
  def test_see_results_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_nil joe.see_results(-4)
  end

  # Tests zero input for prospector
  # EDGE CASE
  def test_see_results_zero
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_nil joe.see_results(0)
  end

  # Tests string input for prospector
  def test_see_results_string
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_nil joe.see_results('Antonino')
  end

  # Tests valid input for prospector
  def test_see_results_valid
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, joe.see_results(2)
  end

  # Tests valid input for prospector formats output correctly
  def test_see_results_valid_output
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    joe = Prospector.new(mock_map, mock_map_finder)
    out_put = "After 0 days, Rubyist 4 found:\n      0 rubies.\n      0 fake rubies.\nGoing home empty-handed.\n"
    assert_output(out_put) { joe.see_results(4) }
  end
end
