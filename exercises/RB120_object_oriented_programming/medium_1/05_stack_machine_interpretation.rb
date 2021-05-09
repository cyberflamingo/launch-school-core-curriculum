class MinilangError < StandardError; end
class InvalidTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  VALID_ACTIONS = %w(ADD DIV MULT MOD SUB PUSH POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
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
    self.register /= pop # /
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

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
