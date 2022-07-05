Lesson 5 - take better notes. learning how to learn, go through a course and go back to get key lesson in each one.

A block like a method will return the last line evaluated.  Whatever is the last line evaluated by the block is what gets returned into the array.  

```Ruby
(1..10).map { |x| x }

{one: 1, two: 2, three: 3} => [[:one, 1], [:two, 2], [:three, 3]] 

[[Toyota, [Camry, Corolla]], [Ford, [F-150, Explorer]], [Honda, [Accord, Civic]]]
# going into map we are looking at each element - an array of nested arrays.
# we pass variables as arguments
# we invoke methods on the objects
a = 10
a.each(a) # a is the argument passing in
# invoke the method on the object, invoking each on the integer 10 which is pointed to by local variable a
# I am invoking the each method and passing in local variable a as the arguemnt pointing to the integer 10
# when calling method on an object, 

#nested array with three elements. 
# for entire iteration, make and models gets assigned to 
# `each` will do something in the block, but it won't update it

# for first iteration
make = toyota models [camry, corolla]
  [camry, corolla].map |model| = camry/corolla
  "Toyota Camry"
  [Toyota Camry, corolla] # return of first one
  [Toyota Camry, Toyota Corolla] # return of second iteration
  


# `map` will first call to_a on anything you pass it and then it will fill the new element of the array. 
=begin

=end

=begin
Build Tower
https://www.codewars.com/kata/576757b1df89ecf5bd00073b/train/ruby

Build a pyramid-shaped tower given a positive integer representing the number of floors. A tower block is represented with "*" character.
=end

p build_tower(3) == [
  "  *  ",
  " *** ", 
  "*****"
]
p build_tower(6) == [
  "     *     ", 
  "    ***    ", 
  "   *****   ", 
  "  *******  ", 
  " ********* ", 
  "***********"
]

def build_tower(num)
  spacer = (num * 2) - 1 # look at the last return from `6` and this line has 11 asterisks.
  stars = 1
  tower = []
  num.times do |layer|
    tower << ('*' * stars).center(spacer)
    stars += 2
  end
  puts tower # will iterate through each element and will create picture
end
    # don't need to manipulate I just need to add
=begin
justify left and justify right that can act on it to fill these spaces

=end

#new problem- first person would take chair 1 , primary thing is furthest from the person and closest to the door .  Find the last chair taken. Trick is `n-1` second to last chair. PEDAC, each iteration has more growth.  High level more individual method to later flush out.  PEDAC. 
# manipulate - creating an image

=begin
Write a method using map that takes an array of numbers and returns the elements with the numbers added by 2
=end

arr = [1, 2, 3, 4]
arr.map {|element| element + 2 }
# invoking map on the array pointed to by local variable arr and passing in 1 block parameter element, each iteration adding 2 to each block local varaiable element, distinguish that it's inside the block. Element is point to 1 then 2 then 3 then 4.  

# ONLY PARAMETER when initializing
# always consider the return value of the block


puts  arr.map do |element|
  element += 2
end.sum

p b

arr = [1, 2, 3, 4]
b = 'hello'

c = arr.map do
  b
end

p c # ["hello", "hello", "hello", "hello"]

# blocks have the lowest amount of precedence.  When passing a block that is multi-lined.  It will work with {} slightly higher precedence. Assignment will make sure that everything to the right of the = sign gets evaluated.  Every line is trying to evaluate every single value. Couldn't do two things. Some methods in the Ruby docs generally represented somewhere else that doesn't have documentation, the doc might be in Enumerable.  Module Enumerable might have the info. 

# Generally `map` will act on an array and return new elements based off of the return value of the block it is passed.  Technically it transforms the elements. 
```
2-3 hours a day, study groups add a little bit.  He doesn't consider study groups study time.  Dog sat, but dogs needed help.  Study time - tough to get more time in.  

my goal is 15-20 hours, built up to 40.  2-3 weeks a month - do this code or stare at code.  body adjusts to all the sitting in front of the computer.  Lead to burnout?  As long as not mentally taxing for the whole time.  Deprive myself of other stimulus.  Might as well code. Remote is spectacular.  Control own pace - do remote, not have to move somewhere. Sign a contract, not get a job. 