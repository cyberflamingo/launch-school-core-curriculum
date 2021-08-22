class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_el = @head

    while current_el
      size += 1
      current_el = current_el.next
    end

    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    @head = Element.new(datum, @head)
  end

  def peek
    @head&.datum
  end

  def pop
    datum = peek
    @head = @head.next

    datum
  end

  def self.from_a(array)
    array = [] if array.nil?
    list = new

    array.reverse_each do |datum|
      list.push(datum)
    end

    list
  end

  def to_a
    array = []
    current_el = @head

    while current_el
      array << current_el.datum
      current_el = current_el.next
    end

    array
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  protected

  attr_writer :head
end

# Time: 01:39:21.7
