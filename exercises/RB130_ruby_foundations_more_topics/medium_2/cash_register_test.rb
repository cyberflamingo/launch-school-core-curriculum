require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  RESERVE = 1000
  PRICE = 100

  def setup
    @register = CashRegister.new(RESERVE)
    @transaction = Transaction.new(PRICE)
  end

  def test_accept_money
    @transaction.amount_paid = PRICE

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + PRICE, current_amount)
  end

  def test_change
    @transaction.amount_paid = PRICE
    change = @register.change(@transaction)

    assert_equal(0, change)

    @transaction.amount_paid = PRICE + 10
    change = @register.change(@transaction)

    assert_equal(10, change)
  end

  def test_give_receipt
    str = "You've paid $#{PRICE}.\n"
    assert_output(str) { @register.give_receipt(@transaction) }
  end
end
