=begin

# PEDAC

## Problem

Create a Circular Queue class of a limited size that let you enqueue and d
dequeue dequeue object.

Input:  enqueuing or dequeuing a new object
Output: the new state of the circular queue

## Examples

(For a 3 slots buffer)

Input:  add 1 to queue
Output: [1, nil, nil]
Input:  add 2 to queue
Output: [1, 2, nil]
Input:  dequeue
Output: [nil, 2, nil]

## Data

An array of fixed length

## Algorithm

initialize
-  an array of fixed size
-  an index indicating the start of valid data (0)
-  an index indicating the end of valid data (0)

enqueue
-  add the item in the buffer at end_index
-  increment end_index by one
-  increment start_index by one if item at end_index is being replaced

dequeue
-  remove item at start_index
-  increment start_index by one
-  return removed item

=end

class FixedArray
  def initialize(max_size)
    @array = Array.new(max_size)
  end

  def [](index)
    @array.fetch(index)
  end

  def []=(index, value)
    self[index]
    @array[index] = value
  end

  def to_a
    @array.clone
  end

  def to_s
    to_a.to_s
  end

  def delete_at(index)
    current_value = @array[index]
    @array[index] = nil
    current_value
  end
end

class CircularQueue
  def initialize(length)
    @length = length
    @buffer = FixedArray.new(@length)
    @start_position = 0
    @next_position = 0
  end

  def enqueue(item)
    if replaced?
      self.start_position = increment(start_position)
    end

    buffer[next_position] = item
    self.next_position = increment(next_position)
  end

  def dequeue
    value = buffer.delete_at(start_position)
    self.start_position = increment(start_position) unless value.nil?

    value
  end

  private

  attr_accessor :buffer, :start_position, :next_position
  attr_reader :length

  def replaced?
    !buffer[next_position].nil?
  end

  def increment(position)
    (position + 1) % length
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue.nil?

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue.nil?

queue = CircularQueue.new(4)
puts queue.dequeue.nil?

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue.nil?
