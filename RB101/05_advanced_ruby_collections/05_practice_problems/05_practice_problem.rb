munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

male_age = 0
munsters.select do |_name, attr|
  male_age += attr.values_at('age')[0] if attr.values_at('gender')[0] == 'male'
end

p male_age
