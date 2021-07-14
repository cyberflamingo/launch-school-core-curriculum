class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(mutated_strand)
    differences = 0

    strand.split('').each_with_index do |letter, index|
      break if index >= mutated_strand.size
      differences += 1 if letter != mutated_strand[index]
    end

    differences
  end

  private

  attr_reader :strand
end
