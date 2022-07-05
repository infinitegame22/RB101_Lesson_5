arr = ['10', '11', '9', '7', '8']
# order is inherent...ASCII number is used to represent unique characters
# characters 0 -9 are already in order just like the numbers
# compare characters or a string sort would return the same 
# array of numbers, sort it, duplicate numbers
arr = [1, 2, 3, 3, 2, 1]
arr.sort

# items that have the same value won't cross over each other if it's a stable sort
['Bob', 'Jim', 'Bob']

# random people of height, tell them to order from shortest to tallest, 5 foot
# toward beginning and end, say they are both the shortest, they will be next to 
# each other, but the one who was in the leftmost position stays in the same leftmost
# position.  If it's unstable, it doesn't matter where they end up. It's in a sorted 
# order.  The relative ordering between them is lost.  Real life applications, usually
# I want to keep the stable sorting so I have a relative order.
arr.map(&:to_i) # => [10, 11, 9, 7, 8]
arr.map(&:to_i) # => [7, 8, 9, 10, 11]
arr.map(&:to_i).sort.map(&:to_s) # => ["7", "8", "9", "10", "11"] 

arr.sort do |a, b|
  a.to_i <=> b.to_i #ascending
  b.to_i <=> a.to_i # descending, use `a` (start) and `z` (end)
end
# => ["11", "10", "9", "8", "7"]