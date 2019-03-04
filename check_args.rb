# Class that checks running arguments
class CheckArgs
  def check_args(args)
    args.count == 3  && args[1].to_i > 0 && args[2].to_i > 0
  rescue StandardError
    falses
  end
end
