flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintsthash = {}

flintstones.each_with_index do |v, i|
  flintsthash[v.to_s] = i
end

p flintsthash
