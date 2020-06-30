produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# def select_fruit(list)
#   list.select do |_k, v|
#     v == 'Fruit'
#   end
# end

def select_fruit(hash)
  fruit_hash = {}
  hash_keys = hash.keys
  i = 0

  loop do
    break if i == hash_keys.size

    value = hash[hash_keys[i]]

    if value == 'Fruit'
      fruit_hash[hash_keys[i]] = value
    end

    i += 1
  end

  fruit_hash
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
