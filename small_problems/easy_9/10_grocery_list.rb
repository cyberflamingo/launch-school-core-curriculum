def buy_fruit(list)
  fruits_list = Array.new

  list.each do |item|
    item[1].times do
      fruits_list << item[0]
    end
  end

  fruits_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
