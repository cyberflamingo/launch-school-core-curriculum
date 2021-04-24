class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is right. There is an accessor method for `balance` and the code inside
# instance method `positive_balance` doesn't initialize a local variable.
