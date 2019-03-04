# Class for Prospector who mines rubies.
class Prospector
  def initialize(map, map_finder)
    @map = map
    @map_finder = map_finder
    @ruby_total = 0
    @fake_ruby_total = 0
    @visited_locations = 1
    @days_mined = 0
    set_ruby_chart
  end

  # Method that allows prospector to mine for rubies/fake-rubies at location
  def mine(iteration, location)
    iteration = iteration.to_i
    location = location.to_i
    return nil if iteration < 0 || location < 0 || location > 6

    loop do
      @days_mined += 1

      ruby = rand(@chart[location][1] + 1).to_i
      fake_ruby = rand(@chart[location][0] + 1).to_i

      if ruby == 1 && fake_ruby == 1
        puts "      Found #{ruby} ruby and #{fake_ruby} fake ruby in #{@map[location][0]}."
      end
      if ruby > 1 && fake_ruby > 1
        puts "      Found #{ruby} rubies and #{fake_ruby} fake rubies in #{@map[location][0]}."
      end
      if ruby == 1 && fake_ruby > 1
        puts "      Found #{ruby} ruby and #{fake_ruby} fake rubies in #{@map[location][0]}."
      end
      if ruby > 1 && fake_ruby == 1
        puts "      Found #{ruby} rubies and #{fake_ruby} fake ruby in #{@map[location][0]}."
      end
      puts "      Found #{ruby} ruby in #{@map[location][0]}." if ruby == 1 && fake_ruby.zero?
      puts "      Found #{ruby} rubies in #{@map[location][0]}." if ruby > 1 && fake_ruby.zero?
      puts "      Found #{fake_ruby} fake ruby in #{@map[location][0]}." if ruby.zero? && fake_ruby == 1
      puts "      Found #{fake_ruby} fake rubies in #{@map[location][0]}." if ruby.zero? && fake_ruby > 1
      @ruby_total += ruby
      @fake_ruby_total += fake_ruby
      puts "      Found no rubies or fake rubies in #{@map[location][0]}." if ruby.zero? && fake_ruby.zero?
      break if ruby.zero? && fake_ruby.zero?
    end
    1
  end

  # Generates random number based on passed in seed
  def random_number(seed, range)
    seed = seed.to_i
    rng = Random.new(seed)
    num = rng.rand(range) + 1
    num
  end

  # Method that picks the prospector's next location
  def next_location(current_location, seed, id)
    current_location = current_location.to_i
    seed = seed.to_i
    id = id.to_i
    return nil if current_location < 0 || current_location > 6

    range = @map[current_location].length - 1
    seed_alt = (seed * 11) % id
    nxt = random_number(seed_alt, range).to_i
    nxt += 1 if nxt.zero?
    return nil if nxt.nil?

    next_loc = @map_finder.get_location_index(@map[current_location][nxt])
    puts "Heading from #{@map[current_location][0]} to #{@map[next_loc][0]}."
    @visited_locations += 1
    next_loc
  end

  # Method that initializes chart with ruby/fake-ruby possibilities
  # Index 0 = fake rubies, Index 1 = rubies
  def set_ruby_chart
    @chart = [[1, 1], [2, 2], [1, 1], [3, 0], [0, 3], [2, 2], [2, 2]]
  end

  # Method to display prospector's results
  def see_results(prospector)
    prospector = prospector.to_i
    return nil if prospector <= 0

    puts "After #{@days_mined} days, Rubyist #{prospector} found:"
    if @ruby_total == 1
      puts "      #{@ruby_total} ruby."
    else
      puts "      #{@ruby_total} rubies."
    end
    if @fake_ruby_total == 1
      puts "      #{@fake_ruby_total} fake ruby."
    else
      puts "      #{@fake_ruby_total} fake rubies."
    end
    if @ruby_total >= 10
      puts 'Going home victorious!'
    elsif @ruby_total > 0 && @ruby_total < 10
      puts 'Going home sad.'
    elsif @ruby_total.zero?
      puts 'Going home empty-handed.'
    end
    1
  end
end
# End of class
