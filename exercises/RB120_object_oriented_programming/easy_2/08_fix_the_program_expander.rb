class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  attr_reader :string

  def expand(n)
    string * n
  end
end

expander = Expander.new('xyz')
puts expander
