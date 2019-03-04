require 'minitest/autorun'
require_relative 'map_finder'
# Class that tests MapFinder class
class MapFinderTest < Minitest::Test
  # UNIT TESTS FOR METHOD get_location_index(location) in MapFinder Class
  # Equivalence classes:
  # location = [-INFINITY..INFINITY] -> returns nil
  # location = valid location name -> returns index of location in array (as integer)
  # location = invalid location name -> returns nil

  # Tests negative number input
  def test_negative_num_input_location_index
    finder = MapFinder.new
    assert_nil finder.get_location_index(-4)
  end

  # Tests positive number input
  def test_positive_num_input_location_index
    finder = MapFinder.new
    assert_nil finder.get_location_index(4)
  end

  # Tests number zero input
  def test_zero_num_input_location_index
    finder = MapFinder.new
    assert_nil finder.get_location_index(0)
  end

  # Tests invalid string input
  def test_invalid_string_input_location_index
    finder = MapFinder.new
    assert_nil finder.get_location_index('Sennot Square')
  end

  # Tests valid string input
  def test_valid_string_input_location_index
    finder = MapFinder.new
    assert_equal 6, finder.get_location_index('Dynamic Palisades')
  end
end
