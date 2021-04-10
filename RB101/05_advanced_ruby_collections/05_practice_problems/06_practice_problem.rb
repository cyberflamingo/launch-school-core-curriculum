munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

def presentation(family)
  name = ''
  age = 0
  gender = ''

  family.each do |member, details|
    name = member
    age = details['age']
    gender = details['gender']

    puts "#{name} is a #{age}-year-old #{gender}."
  end
end

presentation(munsters)
