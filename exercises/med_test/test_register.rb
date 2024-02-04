require 'minitest/autorun'
#require "minitest/reporters"
#Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(50)
    @gum = Transaction.new(5)
  end

  def test_accept_money
    @gum.amount_paid = 5
    assert_equal(55, @register.accept_money(@gum))
  end

  def test_change
    @gum.amount_paid = 10

    assert_equal(5, @register.change(@gum))
  end

  def test_give_receipt
    @gum.amount_paid = 10

    assert_output ("You've paid $#{@gum.item_cost}.\n") {@register.give_receipt(@gum)}
  end
end