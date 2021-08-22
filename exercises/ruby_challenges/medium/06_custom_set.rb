class CustomSet
  def initialize(array = [])
    @set = array.uniq
  end

  def empty?
    @set.empty?
  end

  def contains?(num)
    @set.contains?(num)
  end

  def subset?(other)
    @set.each do |element|
      return false if !other.contains?(element)
    end

    true
  end

  def disjoint?
    @set.each do |element|
      return false if other.contains?(element)
    end

    true
  end

  def eql?(other)
    subset?(other) && !disjoint?(other)
  end

  def add(num)
    @set.push(num) unless @set.contains?(num)
  end

  def intersection(other)
    @set.select do |element|
      other.contains?(element)
    end
  end

  def difference(other)
    @set - intersection(other)
  end

  def union(other)
    @set + intersection(other)
  end
end

# Time: 00:26:08.4
