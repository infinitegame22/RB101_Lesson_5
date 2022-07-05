```Ruby
=begin
You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?
=end

def spin_me(str)
  str.split.each do |word| 
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

arr = ["hello", "world"]
puts arr.object_id
p spin_me(arr) # ["olleh, dlrow"]
puts arr.object_id

#puts spin_me(arr).object_id

input: Hash
output: integer that is the sum of the male ages from the Hash
figure out the total age of just the male members of the family. The hash to work with is:
=end



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def male_age_sum(hash)
  age_sum = 0
  hash.each do |key, value|
    if value["gender"] == "male"
      age_sum += value["age"]
    end
  end
  age_sum
end

p male_age_sum(munsters)

def male_age_sum(hash)
  hash_values = hash.values
  hash_values.reduce(0) do |init_val, nested_hsh|
    if nested_hsh["gender"] == 'male'
      init_val + nested_hsh['age']
    else
      init_val
    end
  end
end

p male_age_sum(munsters)
```
