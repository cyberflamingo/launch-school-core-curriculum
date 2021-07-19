class PerfectNumber
  def self.classify(number)
    @number = number
    list = positive_divisers
    natural_number_classification(list)
  end

  def self.positive_divisers
    evenly_divisable = []

    1.upto(@number - 1) do |diviser|
      evenly_divisable << diviser if @number % diviser == 0
    end

    evenly_divisable
  end

  def self.natural_number_classification(list)
    aliquot_sum = list.reduce(:+)

    if aliquot_sum < @number
      'deficient'
    elsif aliquot_sum == @number
      'perfect'
    elsif aliquot_sum > @number
      'abundant'
    end
  end
end
