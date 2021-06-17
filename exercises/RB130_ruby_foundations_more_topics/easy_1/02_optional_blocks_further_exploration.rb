def compute(default = 0)
  return 'Does not compute.' unless block_given?
  yield(default)
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

p compute(10) { |num| 5 + 3 + num } == 18
p compute(2) { |num| 'a' + 'b' * num } == 'abb'
p compute(6) == 'Does not compute.'
