Lucas - Valencia, ESP RB101 Lesson 2 love programming.
  3 am where he is, 100 degrees.
Richard - finished course and signed up for 109.
Jesse - LA, RB 101 Lesson 3.

Study Tips -

Learn your tools. Whatever tool you are using learn how it works.  Watch the shortcuts on YouTube videos of people showing how to use the tool.  VS Code - picking up new tricks from code. Fluency in tools will payoff in the long run. Learn how to read documentation.  It doesn't take that long to learn, could also be a waste of ten minutes. 

Self care, sleep, eating healthy foods.
Lucas - avoid rabbit holes
Richard - putting in as much time as he can. Don't be afraid to review your material.
Jesse - last two weeks, what's helped his motivation is sharing it with more people.  

Methods should only be this long.  Methods should only do this one thing.  Get away from giant method and picking bits out. 

Stack trace will go from method to method until it reaches the point where it gets the error.

Expressions are hard to use. Do not need to know them for a couple of courses.  Not till later in the backend part of core.  Lot of powerful tools. Basis stuff that they replace that is useful to me now is the really basic stuff, how they're formatted, how to pick out a letter A-Z regardless of case. How would you pick out the path of a url.  That stuff where regex starts to grow and become unreadable.  Know where the Ruby tool is.  A lot of practice problems. Change language - regex changes by just a little. Lucas uses it for floater integers and `.`. Being able to do that without pulling up the tool. https://rubular.com
Useful tool when you're working in Ruby, play around really quickly. 

Working with Collections - 
spiel *** 

JUMP! Very important, not just for 101, but programming in general. One of the best tools to show understanding of a lot of concepts. Show that I understand working with variables as pointers and such. Work with a lot in programming in general. Data is a whole lot easier to work with if it has a structure.  I need to know how the structure works to find what I am looking for.  RB101 has 2 lessons dedicated to this. General programming concept. Data structure - variety of string ,arrays, hashes
These are an arrangement of data locations. Abstracted for me to access. Some of these data types can't be broken down at all.  Some can and we poke at the sub-elements of these structures.  In Ruby, strings are collections. Mutable! Python, JS strings aren't mutable.  Only true for this language at this time.  These are the sort of little language rules to familiarize myself with during each project. See how things are held together.  In all these languages we have containers - broad topic that contains collections. Containers in general - lists, stacks, queues, arrays depending on the language.  Collections are traversable. We can access any element in the collectoin.  A stack is a container, but not a collection becuase only top of stack is accessible.  An array can hold a bunch of numbers, arrays, hashes...really a collection of pointers to objects in memory.  

Hashes are assciative arrays. Keys pointing to objects. A lot of times in Ruby using symbols as keys.  Symobls are immutable strings.  Hashes later.

Bottom line: need to be comfortable referencing elements in collections, iterating through collections, going from one type to another.  Need to be able to work with a collection given to me. Add elements, find elements, so on and so forth. 

```Ruby
str = 'abcdefg'
p str[2, 3] # => 'cde'
p str[2..4]
p str[2...5]
p str[2] + str[3] + str[4]
p str.slice(2, 3)
```
Many ways to get the same result.  Line 17 and line 21 are aliases of each other, which is why their arguments look the same. 

What if we wanted to get those same indices `[3, 4, 5]` from `arr = [1, 2, 3, 4, 5, 6, 7]`

What we have here is an instance of polymorphism. On line 29 we have the `select` method. 

```Ruby
p arr[2..4] # arr.[](2..4)
p arr[2...5]
p arr.values_at(2, 3, 4)
p arr[-5..-3]
p arr.select { |num| num > 2 && num < 6 }
p arr[2, 3]
p arr.slice(2, 3)
```

Look at all the ways we can get the same answer out of an array.  Some performance differences that are miniscule at this stage in our coding. 

Suggest that strings and arrays have the same sort of structure.  I can use that when say I want to do something with strings that maybe I don't know how to do with a string object but do know how to with an array object.  

I have a string.  How do I go from one type of collection to another? There are things I can do with strings that I can't do wtih arrays and vice versa.  

```Ruby
str = 'Hello World!!!'
p str.split
p str = str.split.join(' ')
```
`split` automatically splits on spaces. `join` requires a delimiter argument of `' '` to include the space between words.

## Hashes
`hsh = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7}`
`p hsh.select { |_, val| val > 2 && val < 6 }`
`p hsh.to_a[2..4].to_h`

Very easy to convert these data types to each other. `to_h` and so on.  Can Ruby change this to another data type for me to work with. One side note on hashes - it's pretty common when I make a hash I am assigning values to variables. Hash keys are not variables they are objects.  We are associating the integer object `1` with symbol object `a`.

Can only have 1 of a key in a hash.  There can only be 1 of a symbol.  Nice linearity of thought.  Can be anything I want. Explicitly not a variable.  And that takes us to time. 

each iterates over each 
select filtering new array of whatever the block returns true for
map returns array with every element transformed with how the block tells to transform. 
Ruby 1.9 strings have an each method. Before that turn it into something else or call it in a `for` loop or a `while` loop. 