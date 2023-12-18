require 'minitest/autorun'
#require "minitest/reporters"
#Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(50)
    gum = Transaction.new(5)
    gum.amount_paid = 5
    assert_equal(register.accept_money(gum), 55)
  end

  def test_change
    register = CashRegister.new(50)
    gum = Transaction.new(5)
    gum.amount_paid = 10

    assert_equal(register.change(gum), 5)
  end

  def test_give_receipt
    register = CashRegister.new(50)
    gum = Transaction.new(5)
    gum.amount_paid = 10

    assert_output ("You've paid $#{gum.item_cost}.\n") {register.give_receipt(gum)}
  end
end