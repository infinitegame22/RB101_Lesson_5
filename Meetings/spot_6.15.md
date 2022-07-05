AJ - 40 years old. System side of the house. RB101 track started Lesson 2 right now.
JD - start of lesson 5. Working through talk out PEDAC process. 
Jason - main activities. Written assessment
problems - up to us.

Describing code work.
```Ruby
def fix(value)  
  value << 'xyz'  # => 'helloxyz'
  value = value.upcase  #=> helloxyz
  value.concat('!') #=> 'HELLOXYZ!'
end
s = 'hello' #=> 'helloxyz' initialized local variagle
#initialize return value pass in `s` as an argument
#argument vs. parameter
#parameter is used as method definitions as place holder
# argument is specific to method
=begin
what is relationship to `s` and `value`? same different.  usually pass by refernece, then when value is reassigned.  Pass by reference value
pass s is a reference to this string 'hello'
when we call the :fix method, local variable value and loca variable s are pointing to the same string
t = fix(s) #=> 'HELLOXYZ!'
reassigning local variable value, after line 3 `s` and `value` are pointing 
last evaluated expression of a method is a erturn vale
we initialize t and assign it the return value of the method call.
pass by reference value. 
Pass by reference, not expected to write those exact words. Tricky area when it comes to wording.  Everything is pass by reference value.  What we are passinginis not a copy of the string. We are passing pointers to the string.
=end
#Before running this code, explain what the last line outputs, and why.
x = 'abc' # intialize local variable x to a string object
y = [x, 'def'] # first element, second element

loop do
  y[0] << '123' # inside the block we invoke the shovel method pushing in string object `123`
  break
end
 
p x #invoke p method => 'abc123`
```
Loop and end - create a varaible's scope. Work with variables and mutate within the loop. 
When we have a block as part of a method call what does it establish? -inner scope
relative to outer scope

What are the specific rules about what can be access from either of those locations.
Variables initialized in the outer scope can be accessed in the inner scope, but not vice versa.

What happens when you have a variable inside another element like this? What is going on when we initialize `y`?
Pass it an array, first element is referening the string object. The first element contains the object pointing to the string object 'abc`
```Ruby
foods = ['pizza', 'pasta', 'salad']
drinks = ['soda', 'wine', 'water']
pairings = {}

(0...foods.length).each do |i|
  pairings[foods[i]] = drinks[i]
end
=begin
#=> pairings = { 'pizza' => 'soda', 'pasta' => 'wine', 'salad' => 'water'}

=end
drinks[2].prepend('sparkling ') 
drinks[1].upcase

p pairings 
```
```Ruby
def topping(meal)
  meal << ' with cheese' # => 'Hamburger with cheese'
end

def add_sides(meal)
  topping(meal)
  meal + ' and Coke' # => 'Hamburger with cheese and Coke'
end

meal = 'Hamburger'
add_sides(meal) # => 'Hamburger with cheese and Coke'
puts meal # => 'Hamburger with cheese'


=begin
Desired output is list of all car makes and models:

Toyota Camry
Toyota Corolla
Ford F-150
Ford Explorer
Honda Accord
Honda Civic

Will this code work? If not, how do you fix it.
=end

cars = {
  'Toyota': ['Camry', 'Corolla'],
  'Ford':   ['F-150', 'Explorer'],
  'Honda':  ['Accord', 'Civic']
}

all_models = cars.map do |make, models| #=> "Toyota", ["Camry", "Corolla"]
  models.map do |model|
    "#{make} #{model}"
  end
end

=begin

input hash key-value pair string: Array
output map and each method called on the multidimensiaonla
=end

puts all_models 

# I want a list of apple devices. Does the code return what I want? If not, how do I fix it?
# Desired output: ["iPad", "iPhone", "Macbook"]

apple_devices = ['Macbook', 'iPad', 'iPhone']
all_devices = ['PC', 'iPad', 'Chromebook', 'iPhone', 'Macbook']

selected_devices = all_devices.select do |device| 
  apple_devices.include? device
end

p selected_devices



=begin
Build Tower
https://www.codewars.com/kata/576757b1df89ecf5bd00073b/train/ruby

Build a pyramid-shaped tower given a positive integer representing the number of floors. A tower block is represented with "*" character.

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

input: positive integer representing number of floors
output: a pyramid-shaped tower with integer number of floors made out of "*", made out of an array of strings
Explicit: positive integers only
Implicit: center the asterisks on each line
  - odd numbers increasing

D: Initialize count and assign it to 0
build the array as number of strings ranging from 1 to integer
center character

E: above
=end

def build_tower(int)
  tower = []
  num = 1
  int.times do
    tower << ("*" * num).center((int*2)-1)
    num += 2
  end

  puts tower
end