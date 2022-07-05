- Topics: 
  - `sort` mechanics
  - `sort_by` 
  - `each`
  - return values 

## Summary  - sort is not a mutating method. It returns a new array which has a different object_id than the original object/array. By initializing an array and assigning it to a variable this ensures a stable object_id.  Each time an object is initialized no matter if it has the same content, will return a new object id if unassigned to a variable.

`<=>` (spaceship, aka SPAICESHIP) - smooth operator takes in two operands. As a result of evaluating or comparing these two operands, returns 1 `-1`, `0`, or `1`. 

`1 <=> 2` # => -1



#   <=> (spaceship, aka SPOOCESHIP)  

arr = [3,2,1] # [1,2,3]
arr.sort 

# Summarize Sort - `sort` is an instance method of the classes Enumerable, Array, and Hash. It is called on a collection to provide a more logical dispersion/organization of the elements found in the collection. Under the hood, `sort` is using the `<=>` spaceship operator on two elements of the array to determine greatness and repositioning of the elements. If left operand is greater than the right operand, the spaceship operator returns 1. When `sort` sees a `1`, left operand is moved to the right of the right operand in the array. When `sort` sees a `-1` as the result the operands stay where they are.

# p arr.sort { |a, b| a <=> b }

# 

arr = [3, 2, 1] 
p arr.sort { |a, b| b <=> a } 
# a => 3
# b => 2
2 <=> 3 # =>  -1 

# Sort_by works with the return elements `1`, `0`, `-1`, and `nil`.  

# 1 <=> 2? 
# 1 <=> "Dragon"

# arr = ["abc", 1,"sBgAASNDHASKJD"] 
# arr.sort_by { |feces| feces } 
# Sort_by - nil compared to nil is CHILL