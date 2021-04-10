def my_method(array)
  if array.empty?
    []
  elsif array.size == 1
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

=begin

Before fixing the bug, On `line 4`, no condition was written behind `elsif`
therefore Ruby used the following line (`array.map...`) as the condition for
it. In this case, calling `#map` with the `do..block` always returns an array
which evaluates to true, making the program enter in this ramification. As
there is nothing inside it, `nil` is returned instead.

The code can be fixed by adding a formula to evaluate to the first `elsif`
and switch the code inside `elsif` and `else`.

=end
