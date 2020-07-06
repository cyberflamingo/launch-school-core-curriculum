munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

def age_group(age)
  age_group = case age
              when 0..17
                'kid'
              when 18..64
                'adult'
              else
                'senior'
              end
  age_group
end

munsters.each_key do |member|
  munsters[member]["age_group"] = age_group(munsters[member]["age"])
end

p munsters == { "Herman" => { "age" => 32, "gender" => "male",
                              "age_group" => "adult" },
                "Lily" => { "age" => 30, "gender" => "female",
                            "age_group" => "adult" },
                "Grandpa" => { "age" => 402, "gender" => "male",
                               "age_group" => "senior" },
                "Eddie" => { "age" => 10, "gender" => "male",
                             "age_group" => "kid" },
                "Marilyn" => { "age" => 23, "gender" => "female",
                               "age_group" => "adult" } }
