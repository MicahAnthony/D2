require 'minitest/autorun'
require_relative 'simulator'
# Class that tests simulator class
class SimulatorTest < Minitest::Test
  # UNIT TESTS FOR METHOD start in Simulator Class
  # Equivalence classes:
  # Accepts no parameters, but it is expected to ALWAYS, return 1 upon completion

  # Test that method returns 1 upon completion.
  def test_start
    sim = Simulator.new(1, 2, 3)
    mock_prospector = Minitest::Mock.new('Mock Prospector')

    def mock_prospector.see_results(_param)
      1
    end

    assert_equal 1, sim.start()
  end


  # UNIT TESTS FOR METHOD run_simulation(num_prospector, joe) in Simulator Class
  # Equivalence classes:
  # num_prospector = -INFINITY..-1 -> returns nil
  # num_prospector = 0..INFINITY -> returns 1, snd tuns simulation as expected
  # going to 5 locations
  # num_prospector = (not a number) -> returns nil
  # joe = Object of type Prospector -> returns 1
  # joe = Object not of type Prospector -> returns nil

  # Test that negative value for num_prospector returns nil
  # EDGE CASE
  def test_run_simulation_negative
    sim = Simulator.new(1, 2, 3)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2, _param3)
      1
    end

    def mock_prospector.next_location(_param, _param2, _param3)
      1
    end

    assert_nil sim.run_simulation(-1, mock_prospector)
  end


  # Test that a value of zero for num_prospector returns 1
  # EDGE CASE
  def test_run_simulation_zero
    sim = Simulator.new(1, 2, 3)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2, _param3)
      1
    end

    def mock_prospector.next_location(_param, _param2, _param3)
      1
    end

    assert_equal 1, sim.run_simulation(0, mock_prospector)
  end

  # Tests that non-negative int value for num_prospector returns a 1. Then
  # continues normal behavior and runs the simulation as expected.
  def test_run_simulation_passes
    sim = Simulator.new(1, 2, 3)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2, _param3)
      1
    end

    def mock_prospector.next_location(_param, _param2, _param3)
      1
    end

    assert_equal 1, sim.run_simulation(5, mock_prospector)
  end

  # UNIT TESTS FOR METHOD set_map() in Simulator Class
  # Equivalence classes:
  # Accepts no parameters, but it is expected to ALWAYS, return the 2D
  # Array displayed below.

  def test_set_map
    map = [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Enumerable Canyon', 'Matzburg'],
      ['Monkey Patch City', 'Nil Town', 'Enumerable Canyon', 'Matzburg'],
      ['Nil Town', 'Monkey Patch City', 'Hash Crossing'],
      ['Matzburg', 'Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'],
      ['Hash Crossing', 'Matzburg', 'Nil Town', 'Dynamic Palisades'],
      ['Dynamic Palisades', 'Matzburg', 'Hash Crossing']
    ]
    sim = Simulator.new(1, 2, 3)
    assert_equal map, sim.set_map
  end
end
