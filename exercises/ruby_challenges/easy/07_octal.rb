class Octal
  def initialize(num)
    @number = valid_octal?(num) ? num.to_i : 0
  end

  def to_decimal
    expand(@number.digits, 8).sum
  end

  private

  def valid_octal?(num)
    num.chars.all?('0'..'7')
  end

  def expand(digits, base)
    expanded = []

    digits.each_with_index do |digit, power|
      expanded << digit * (base**power) unless digit == 0
    end

    expanded.reverse
  end
end
