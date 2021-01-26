def buy_fruit(list)
  fruit_list = []

  list.each do |fruit_quantity|
    fruit_quantity[1].times do
      fruit_list << fruit_quantity[0]
    end
  end

  fruit_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
