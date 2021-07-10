def group_raptors(array)
  yield(*array)
end

birds = %w(raven finch hawk eagle)

group_raptors(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}"
end
