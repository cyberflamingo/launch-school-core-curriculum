require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < Minitest::Test
  PRICE = 100

  def setup
    @transaction = Transaction.new(PRICE)
  end

  def test_prompt_for_payment
    input = StringIO.new("#{PRICE}\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(PRICE, @transaction.amount_paid)

    std = <<~HEREDOC
              You owe $#{PRICE}.
              How much are you paying?
          HEREDOC
    input = StringIO.new("#{PRICE}\n")
    assert_output(std) { @transaction.prompt_for_payment(input: input) }

    input = StringIO.new("200\n")
    @transaction.prompt_for_payment(input: input)
    assert_equal(200, @transaction.amount_paid)
  end
end
