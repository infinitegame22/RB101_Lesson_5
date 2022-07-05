singular items in each array first
each - sub array 1
    - sub array 2
starting at the most zoomed out, the outer array has the two inner array.
Looking at the sub-arrays abstractly.
Calling `each` on the sub-arrays
- nested `for` loop

1st level is looking at the sub-arrays as a singular thing
`each` is looking at the actual
```Ruby
for arr in [[18, 7], [3, 12]] do
  for num in arr
    if num > 5
      puts num
    end
  end
end
```
code above can achieve the same thing. `each` is saying look at every item in this collection and do this.  `for` loop can be given conditions.  Classic way to iterate over something. 

output - printing to the terminal
return value - when a function/method completes, able to store whatever it returns into a variable or pass that variable to another function

`map` will return the same data structure, but will return the modified one. New array is the data processed through `map`. `each` is a way to look at the items in a collection.  `each` is not going to apply it and mutate it.  `map` 's intention is to mutate the underlying structure. The result of the block in `each` is discarded.  Apply the changes from the block to the original array and return the modified array when `map` is called.

Line 1 - `map` method is called on the array with two containers and passed the block with a parameter of `arr`, 
Line 2 - `map` method is called on `arr` parameter and pass the block with a parameter of `num`
Line 3- multiply `num` by 2
4 - Each element of the sub array is being transformed to double its value

Looking at the first level of depth - two levels of depth with nested arrays.

A function like `map` is not explicit how it's working in any languages.  

`return` is leeting the function know when the inner function is done. A program will have an entry point, when things are being called within it `return` returns you to the parent function.