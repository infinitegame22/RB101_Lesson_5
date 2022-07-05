https://launchschool.com/exercises/56e92849

```Ruby

# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# Input is a string object (sentence)
# Output is a new string Object
=begin
https://www.digitalocean.com/community/tutorials/how-to-work-with-string-methods-in-ruby

[]= aka setter method

split the string into an array of words and set  new array to split string
Iterate through the array and for each element set last letter to first. 
Iterate through 
=end

#  word = 'boy'
#  holder = word[0]
#  word[0] = word[-1]
#  p word
#  word[-1] = holder

#  p word

def swap(sentence)
  arr = sentence.split
  new_arr = arr.each do |word|
    # holder = word[0]
    # word[0] = word[-1]
    # word[-1] = holder
    word[0], word[-1] = word[-1], word[0] #multiple assignment https://www.geeksforgeeks.org/parallel-assignment-in-ruby/
  end
  new_arr.join(' ')
end
 
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'


def swap_letter(word) # => helper method
  temp = word[0]
  word[0] = word[-1]
  word[-1] = temp
  word
end

def swap_words(words)
  final_string = ''
  swap_arr = []
  word_arr = words.split
  # you can also use a map to iterate and manipulate
  word_arr.each do |element|
    swapped_word = swap_letter(element)
    #swap_arr << swapped_word
    final_string += swapped_word + ' '
  end
  #swap_arr.join(' ')
  final_string = final_string.strip
end

sentence = 'this is a test'
str = sentence [0..4]
p str
arr = 
```

B

```Ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal


def swap(sentence)
  arr = sentence.split.each do |word| # => calling each on an array of three elements
    word[0], word[-1] = word[-1], word[0]
    arr
  end
  arr #=> [["o", "H"], ["r", "d"], ["d", "w"]]
  arr.join(' ') # => "o H r d d w"
end

words = "Hello dear world"

p swap(words)

# map vs each - map method call on the sentence.split output returns `"o H r d d w"`. 
```
`map` returns an array.

`[1, 2, 3, 4].map` whatever the block returns, pass the element into the block and that is what map uses as the rule for transformation. based on the return element of the block.  Map selects the letters, just the letters.

What is map returning? Use the return of the block to run the next line or give the answer.

## Map vs. select

`select` has a condition in the block, element from the collection I am iterating over it. What the block cares about it is the truthiness of the return value of the block.  Everything in Ruby is truthy, except for `false` or `nil`.  If the block returns `nil` or `false` that item will not be selected. If a collection has 100 items, it will return 0- 100 items.  If after passing all the elements and don't get a truthy value, there could be 0. 

## `sort` vs. `sort_by`
`sort` goes by pairs.  how I want my collections to be ordered. How do I want it , from maximum to minimum.  A lot of sorting algorithms. How does Ruby sort? Two things:
1. Ruby `sort` method uses return value of comparison
2. for each object/data type has something like this `<=>` which always return -1, 0, 1.  `2 <=> 3`, if left operator is less than operand on right then returns 1. Sorting cannot do anything without returning the value of this method. Check string, Integer, all classes they have this method. 