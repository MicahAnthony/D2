require_relative 'prospector'
require_relative 'map_finder'
# Class that runs Ruby Rush simulation
class Simulator
  def initialize(seed, num_prospectors, num_turns)
    @seed = seed
    @num_prospectors = num_prospectors
    @num_turns = num_turns
  end

  # Starts the simulator and keeps it running
  def start
    puts 'Start Simulator'
    set_map
    x = 1
    while x <= @num_prospectors
      joe = Prospector.new(@map, MapFinder.new)
      run_simulation(x, joe)
      joe.see_results(x)
      x += 1
    end
  end

  # Sets up the map
  def set_map
    # Sets locations on the map
    @map = [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Enumerable Canyon', 'Matzburg'],
      ['Monkey Patch City', 'Nil Town', 'Enumerable Canyon', 'Matzburg'],
      ['Nil Town', 'Monkey Patch City', 'Hash Crossing'],
      ['Matzburg', 'Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'],
      ['Hash Crossing', 'Matzburg', 'Nil Town', 'Dynamic Palisades'],
      ['Dynamic Palisades', 'Matzburg', 'Hash Crossing']
    ]
  end

  # Let the Prospecting begin!
  def run_simulation(num_prospector, joe)
    num_prospector = num_prospector.to_i
    # Iterate through each turn
    count = 0
    y = 0
    puts "\nRubyist #{num_prospector} starting in #{@map[y][0]}"
    while count < @num_turns
      joe.mine(count, y, @seed)
      count += 1
      y = joe.next_location(y, @seed, num_prospector) unless count >= @num_turns
    end
  end
end
