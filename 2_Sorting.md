So far when exploring collections, we've looked at various different ways of working with them such as iterating through them, performing selection on the collection or performing transformation on the elements in the collection. We then studied various methods that can make those task easier.

Another common way of working with collections that we haven't yet talked about is to sort them into some kind of order. Sorting is mostly performed on arrays; since items in arrays are accessed via their index, the order in which those items appear is important.

Strings don't have access to any sorting methods (though, as we have seen previousely, if you want to work with a string in the same way as an array it is easy to convert it into an array and then sort it).

Prior to Ruby 1.9, `Hash` objects did not maintain a set order so it was not possible to sort them. Since Ruby 1.9 it is possible to sort a hash, though because hash values are accessed via their keys there generally isn't a need to do this.

### What is sorting?

Sorting is setting the order of the items in a collection according to a certain criterion. For example, if we look at these two arrays of integers:
```Ruby
[2, 5, 3, 4, 1]
[1, 2, 3, 4, 5]
```
They both contain the exact same integers but in the second array the integers are ordered numerically. 

Assuming that the first array in the above example is our starting point and we want to then get from that to the second array, how do we achieve this? We would need some kind of mechanism to use on the first array in order to put all the items of that array into a particular order.

With some of the other concepts we've looked at so far in this lesson - such as iteration, selection, and transformation - we've shown how those actions can be performed algorithmically, via the use of fairly simple looping mechanisms, before moving on to look at specific methods in Ruby that can do those things for us.

Although it is also possible to write looping code to perform sorting manually, this code would have to be fairly complex and is beyond the scope of what we're looking at in this lesson. Luckily for us Ruby provides a couple of methods that can do this complex work for us: `sort` and `sort_by`.

Going back to our previous example, we could call `sort` on the first array:

`[2,5,3,4,1].sort

The return value is a new array with the integers ordered sequentially according to their value.

Under the hood of the sort method is the complex algorithm we discussed earlier. We don't need to see this, or understand how the method is implemented, in order to use it. What we do need to understand though is the way in which sort applies criterion in order to return an ordered collection.

### Comparison

Sorting is essentially carried out by comparing the items in a collection with each other, and ordering them based on the result of that comparison. Comparison is at the heart of how sorting works.

Sorting integers via comparison may seem obvious. For example we all know that 2 comes after 1 in numerical order, but how does Ruby know how to order items when it comes to sorting a collection?

Let's look at another example:

```Ruby
['c', 'a', 'e', 'b', 'd'].sort # => ['a', 'b', 'c', 'd', 'e']
```
Calling sort on the array of characters returns a new array of characters, ordered alphabetically. Again, this makes sense when viewed in isolation - after all, we know that 'a' comes before 'b', which comes before 'c', etc.

When we call sort on an array though, it doesn't know whether that array contains integers, strings, or some other type of object; so how does it know how to order the elements in the array?

The answer is that it uses a method to determine this; the <=> method (sometimes referred to as teh "spaceship" operator).

### The <=> Method

Any object in a collection that we want to sort must implement a <=> method. This method performs comparison between two objects of the same type and returns a -1, 0, or 1, depending on whether the first object is less than, equal to, or greater than the second object; if the two objects cannot be compared then nil is returned.

```Ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```
The return value of the <=> method is used by sort to determine the order in which to place the items. If <=> returns nil to sort then it throws an argument error.

```Ruby
['a', 1].sort # => ArgumentError: comparison of String with 1 failed
```
The sort method doesn't actually care about how <=> compares items, all it is concerned about is the return value of the <=> method (that is, it's looking for -1, 0, 1, or nil). When using sort however, it is important to know how <=> performs comparison for the type of object that you want to sort; the place to check for that is in the documentation. If you want to sort a collection that contains particular types of objects (e.g. strings or integers) you need to know two things:

1. Does that object type implement a <=> comparison method?
2. If yes, what is the specific implementation of that method for that object type (e.g. String#<=> will be implemented differently to Integer#<=>).

If we look at the [Ruby docs].(https://ruby-doc.org/core-3.1.2/String.html#method-i-3C-3D-3E)

```Ruby
'foo' <=> 'foo' # => 0
'foo' <=> 'food' # => -1
'food' <=> 'foo' # => 1
'FOO' <=> 'foo' # => -1
'foo' <=> 'FOO' # => 1
'foo' <=> 1 # => nil
```
it simply tells us:
---
Comparison--Returns -1, 0, 1 or nil depending on whether string is less than, equal to or greater than other_string.

**The ASCII Table**

Concepts like greater than, less than and equal to are fairly obvious when dealing with integers; but how does the String#<=> understand these concepts? The answer is that String order is determined by a character's position in the ASCII table.

Is is this ASCII character order that determine the result if we compare one ASCII character with another using the String#<=> method.

For example comparing uppercase 'A' with lowercase 'a' returns -1 because 'A' precedes 'a' in ASCIIbetical order.

```Ruby
'A' <=> 'a' # => -1
```
Similarly '!' precedes 'A':
```Ruby
'!' <=> 'A' # => -1
```
You can determine a string's ASCII position by calling ord on the string.
```Ruby
'b'.ord # => 98
'}'.ord # => 125
```
Based on the above example we know that 'b' should come before '}'.
```Ruby
'b' <=> '}' # => -1
```
I don't need to memorize all the positions in the ASCII table, but when dealing with comparing or sorting strings it is important to know that they are ordered in a particular way and roughly what that order is. Some useful rules to remember are:
- Uppercase letters come before lowercase letters
- Digits and (most) punctuation come before letters
- There is an extended ASCII table containing accented and other characters - this comes after the main ASCII table
---
### The sort method

As we have already seen, we can simply call sort on an array, which returns a new array of ordered items; when we do this, comparisons are carried out using the <=> method on the items being sorted.

We can also call sort with a block; this gives us more control over how the items are sorted. The block needs two arguments passed to it (the two items to be compared) and the return value of the block has to be -1, 0, 1 or nil.

```Ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]
```
In the above example, we're just using Integer#<=> in the block to perform the comparison, which is exactly what sort would have done by itself without the block of code. While this may not be the best example, it shows that the result is the same.

In the below example, by switching the order in which the items are compared the new array is returned in descending order.

```Ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```
You are allowed to write additional code in the block, as long as teh block returns -1, 0 or nil.

```Ruby
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]
```
Here we are outputting the values of the two items being compared each time sort calls the block. Although we can't see the algorithm underlying sort, the number of comparisons and the order in which it performs them should give you some idea as to its complexity. 

As previously stated, when sorting a collection it is important to understand the <=> method of the items in the collection that you want to sort. Have a read through the Ruby docs for String#<=>. Without running the code, try to figure out what would be returned here:

```Ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort

# => ['ants', 'arc', 'bat', 'cap', 'cape']
```
There is also an Array#<=> method. Have a read of the Ruby docs and see if I can work out what would be returned when sort is called on this array of arrays:
```Ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [[['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]
```
The documentation states that "Each object in each array is compared... in an 'element-wise manner', so the first object in all of the arrays is compared initially. Since three of the arrays have the string 'a' at their first index, these all come before the array that has the string 'b' at its first index.

You will have noticed that the sub-array that has 'b' at its first index has an integer 2 at its second index. We already know that comparing an integer with a string will return `nil`, which will cause `sort` to throw an error. In this case, since `sort`did not need to compare the second item of that array to be able to establish its order, the integer does not come into play here and so no error is thrown. If the first item in that array had been an `'a'`, like the other arrays, then the integer would have come into play and an error would have been thrown:
```Ruby
[['a', 'cat', 'b', 'c'], ['a', 2], ['a', 'car', 'd', 3]]
# => ArgumentError: comparison of Array with Array failed
```
There is another sub-array which contains an integer `['a', 'car', 'd', 3]`. In this case the integer *does* come into play, but only in terms of comparing the length of this array with the array `['a', 'car', 'd']`. The integer itself is not compared with a string, so again no error is thrown.

Don't worry if this seems a little confusing at the moment. Working with nested arrays like this can be fairly complex. We'll look in more depth at working with nested collections in a later assignment.

### The `sort_by` method

`sort_by` is similar to `sort` but is usually called with a block. The code in the block determines how the items are compared.

```Ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]
```
Here we are sorting using the character at index `1` of each string, so only the characters `'a', 'e',` and `'o'` are compared and the strings ordered according to the comparison of those characters. The other characters in the strings are ignored entirely.

We stated previously that there generally isn't a need to to sort hashes, since hash values are accessed via their keys rather than position. IF you did want to sort a hash however, calling `sort_by` on i would be a way to do so.

When calling `sort_by` on a hash, two arguments need to be passed to the block - the key and the value. IN the `people`hash in the following example, the keys are each person's name and the values are their ages.

```Ruby
people = { Kate: 27, john: 25, Mike: 18 }
```
The last argument evaluated in the block should then be the thing by which we want to sort, so if we wanted the hash sorted by age we could do the following:
```Ruby
people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
```
`sort_by always returns an array, even when called on a hash, so the result here is a new array with the key-value pairs as objects in nested arrays. If we need to convert this back into a hash we can call ```Array.to_h``` on it. 

What if we want to order the hash by name rather than age? The names in this example are symbols. As we discussed earlier, in order for `sort` to work, the objects that you want to compare must implement a `<=>` method. We therefore need to check the [Ruby docs].(https://ruby-doc.org/core-3.1.2/Symbol.html#method-i-3C-3D-3E) to see if there is a `Symbol#<=>` method and if so, how it carries out comparison.

If we read the description for `Symbol#<=>` it explains that the symbols are compared *after* `to_s` is called on them, and if we then read the docs for `Symbol#to_s` we see that it "returns the name or string corresponding to" the symbol.

By using `Symbol#<=>` we are effectively comparing strings. We therefore know that we can sort our hash by name.

There's a problem though. You may have noticed that one of the names, `:john`', is not capitalized. Since strings are compared in 'ASCIIbetical order, `:john` will come after `:Kate` and `:Mike`, which may not be what we want.

Luckily there is an easy way to deal with this problem. We can us the `Symbol#capitalize method on each name within the block so that when the keys are compared they are all capitalized.

```Ruby
people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]
```
---
Note: `Array#sort` and `Array#sort_by` have equivalent destructive methods `Array#sort!` and `Array#sort_by!`. With these methods, rather than returning a new collection, the same collection is returned but sorted. These methods are specific to arrays and are not available to hashes. As a general practice, always pay attention to whether the method you're invoking is destructive or returns a new collection (or both). The `!` in the method name is only a guide, and many destructive methods do not contain `!`; you have to read the documentation carefully.
---
### Other methods which use comparison

As we have seen, comparison is at the heart of how `sort ` and `sort_by` work. Ruby has some other methods which use comparison in order to work with collections. Again, the objects being compared need to implement a `<=>` method in order for these methods to be used.
- min
- max
- minmax
- min_by: Returns the elements for which the block returns the minimum values.
- max_by: Returns the elements for which the block returns the maximum values.
- minmax_by
Descriptions and examples of these methods can be found in the Ruby docs for the `Enumerable` methods are available to `Array` and `Hash` because they include this module. Don't worry too mucn about what this means for now, just understand that you can cal these methods on arrays and hashes. 

### Summary

In this assignment we've looked at sorting as another way we can work with collections. A few important points to remember:

- Sorting is complex to carry out algorithmically on your own, but we can use the built-in `sort` and `sort_by` methods to do the complex work for us.
- Comparison at the heart of sorting. When sorting collections, you need to know if the objects you want to sort on inplement a `<=>` method and how that method is defined.
- Methods other than `sort and `sort_by` also use comparison as the basis for how they work.

At this point I should understand the concept of sorting and be comfortable using the `sort` and `sort_by` methods.