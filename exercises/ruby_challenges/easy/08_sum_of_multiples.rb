class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(max_num)
    new(3, 5).to(max_num)
  end

  def to(max_num)
    list = []

    1.upto(max_num - 1) do |digit|
      @multiples.each do |multiple|
        list << digit if digit % multiple == 0
      end
    end

    list.uniq.sum
  end
end
