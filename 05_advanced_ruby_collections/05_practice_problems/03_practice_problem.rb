arr1 = ['a',
        'b',
        ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{ first: ['a', 'b', 'c'], second: ['d', 'e', 'f'] },
        { third: ['g', 'h', 'i'] }]

arr3 = [['abc'],
        ['def'],
        { third: ['ghi'] }]

hsh1 = { 'a' => ['d', 'e'],
         'b' => ['f', 'g'],
         'c' => ['h', 'i'] }

hsh2 = { first: { 'd' => 3 },
         second: { 'e' => 2, 'f' => 1 },
         third: { 'g' => 0 } }

p arr1[2][1][3]

arr2[1].each do |_, v|
  v.each do |v2|
    p v2 if v2 == 'g'
  end
end

p arr3[2].values[0][0][0]

p hsh1['b'][1]

p hsh2[:third].keys[0]
