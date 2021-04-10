arr = [[:a, 1],
       ['b', 'two'],
       ['sea', { c: 3 }],
       [{ a: 1, b: 2, c: 3, d: 4 }, 'D']]

hsh = {}

arr.each do |ele|
  hsh[ele[0]] = ele[1]
end

p hsh
p hsh == { :a => 1,
           "b" => "two",
           "sea" => { c: 3 },
           { a: 1, b: 2, c: 3, d: 4 } => "D" }
