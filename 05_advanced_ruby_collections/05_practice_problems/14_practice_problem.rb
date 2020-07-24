hsh = {
  'grape' => { type: 'fruit', colors: ['red', 'green'], size: 'small' },
  'carrot' => { type: 'vegetable', colors: ['orange'], size: 'medium' },
  'apple' => { type: 'fruit', colors: ['red', 'green'], size: 'medium' },
  'apricot' => { type: 'fruit', colors: ['orange'], size: 'medium' },
  'marrow' => { type: 'vegetable', colors: ['green'], size: 'large' }
}

results = hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map(&:capitalize!)
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end

p results
p results == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
