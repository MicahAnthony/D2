require_relative 'simulator'
require_relative 'check_args'

def incorrect_usage
  puts "Usage:\n*seed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer"
  exit 1;
end
# Check arguments
args = CheckArgs.new
valid_args = args.check_args ARGV
# If valid args start simulation
if valid_args
  seed = ARGV[0].to_i
  num_prospectors = ARGV[1].to_i
  num_turns = ARGV[2].to_i
  @sim = Simulator.new(seed, num_prospectors, num_turns)
  @sim.start
else
  incorrect_usage
end
