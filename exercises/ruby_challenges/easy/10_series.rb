class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    string_size = @string.size
    raise ArgumentError if string_size < length

    result = []
    0.upto(string_size) do |index|
      break if index + length > string_size
      current_slice = @string.slice(index...(index + length))
      result << current_slice.chars.map(&:to_i)
    end

    result
  end
end
