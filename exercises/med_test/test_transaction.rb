require 'minitest/autorun'
#require "minitest/reporters"
#Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    game = Transaction.new(30)
    output = StringIO.new

    assert_nil(game.prompt_for_payment(input: input, output: output), nil )
    assert_equal 30, game.amount_paid

    input = StringIO.new("30\n")
    game = Transaction.new(60)
    assert_raises(NoMethodError) { game.prompt_for_payment(input: input, output: output) }
    assert_equal 30, game.amount_paid

  end
end