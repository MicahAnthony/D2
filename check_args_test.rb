require 'minitest/autorun'
require_relative 'check_args'
# Class that tests CheckArgs class
class CheckArgsTest < Minitest::Test
  # UNIT TESTS FOR METHOD check_args(args)
  # Equivalence classes:
  # args= [-INFINITY..INFINITY,1..INFINITY,1..INFINITY] -> returns true
  # args= (not a number) -> returns false
  # args[1] and args[2]= [-INFINITY..0] -> returns false

  # Test that no arguments on command line fails
  def test_check_args_invalid1
    args = CheckArgs.new
    assert_equal false, args.check_args([])
  end

  # Test that less than 3 args on the command line fails
  def test_check_args_invalid2
    args = CheckArgs.new
    assert_equal false, args.check_args([1, 2])
  end

  # Test that string argument on command line fails
  def test_check_args_invalid_string
    args = CheckArgs.new
    assert_equal false, args.check_args(['HI'])
  end

  # Test that string arguments on command line fails
  # EDGE CASE
  def test_check_args_invalid_string2
    args = CheckArgs.new
    assert_equal false, args.check_args(['HI', 4, 'There'])
  end

  # Test that negative int for args[1] and args[2] on command line fails
  def test_check_args_invalid_negative
    args = CheckArgs.new
    assert_equal false, args.check_args([6, -2, -3])
  end

  # Test that zero for args[1] and args[2] fails on command line fails
  # EDGE CASE
  def test_check_args_invalid_zero
    args = CheckArgs.new
    assert_equal false, args.check_args([2, 0, 0])
  end

  # Test that valid arguments on command line pass
  def test_check_args_valid
    args = CheckArgs.new
    assert_equal true, args.check_args([-5, 2, 3])
  end
end
