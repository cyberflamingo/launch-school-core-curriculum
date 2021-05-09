class MinilangError < StandardError; end
class InvalidTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  VALID_ACTIONS = %w(ADD DIV MULT MOD SUB PUSH POP PRINT)

  def initialize(raw_program)
    @raw_program = raw_program
  end

  def eval(input = nil)
    @program = format(@raw_program, input) unless input.nil?
    @stack = []
    @register = 0
    check_for_invalid_operation
    eval_operations
  rescue MinilangError => e
    puts e.message
  end

  private

  attr_accessor :stack, :register
  attr_reader :program

  def check_for_invalid_operation
    program.gsub(/\-?\d/, '').split.each do |token|
      if VALID_ACTIONS.include?(token)
        next
      else
        raise InvalidTokenError, "Invalid token: #{token}"
      end
    end
  end

  def eval_operations
    program.split.each do |token|
      if VALID_ACTIONS.include?(token)
        send token.downcase
      else
        save_token(token)
      end
    end
  end

  def add
    self.register += pop
  end

  def div
    self.register /= stack.pop # /
  end

  def mult
    self.register *= pop
  end

  def mod
    self.register %= pop
  end

  def sub
    self.register -= pop
  end

  def push
    stack.push(self.register)
  end

  def pop
    raise EmptyStackError, 'Empty stack!' if stack.empty?
    self.register = stack.pop
  end

  def print
    puts self.register
  end

  def save_token(token)
    self.register = token.to_i
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
MPH_TO_KPH = '3 PUSH %<speed_mph>d PUSH 5 MULT DIV PRINT'

c_to_f = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
c_to_f.eval(degrees_c: 100)
# 212
c_to_f.eval(degrees_c: 0)
# 32
c_to_f.eval(degrees_c: -40)
# -40

puts '---'

mph_to_kph = Minilang.new(MPH_TO_KPH)
mph_to_kph.eval(speed_mph: 18)
# 30
mph_to_kph.eval(speed_mph: 30)
# 50
mph_to_kph.eval(speed_mph: 66)
# 110
mph_to_kph.eval(speed_mph: 78)
# 130
