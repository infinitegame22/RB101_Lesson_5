# Nested Data Structures

It's not uncommon for collections to contain other collections. Let's explore a few examples which illustrate how to work with nested data structures. 

### Referencing collection elements

```Ruby
arr = [[1, 3], [2]]
```
In this example we have one array that contains two separate arrays" `[1, 3]` and `[2]`. Each inner array still has its own index even though they're both inside of an array.

Each inner array can be accessed in the same way that you'd access any other array element; the trick is to remember that it's another collection you're referencing. Let's retrieve the first inner array like we typically reference array elements. 

```Ruby
arr[0] # => [1, 3]
```
Now that we have access to the first array, let's dig into that inner array and retrieve its second element -- the integer `3`. To access that inner array element, `3`, we need to reference it again, chaining our element references.
```Ruby
arr[0][1] # => 3
```
### Updating collection elements

Recall that Ruby gives us a very convenient way to update array elements.

```Ruby
arr = [[1, 3], [2]]
arr[1] = "hi there"
arr                 # => [[1, 3], "hi there"]
```
The `arr[1] = "hi there"` is a destructive action that permanently changed the second element in the `arr` array; it replaced the entire `[2]` inner array with the string `"hi there"`.

Likewise, we can modify a value in a nested array in a similar way.

```Ruby
arr = [[1, 3], [2]]
arr[0][1] = 5
```
There's a lot going on in that second line of code above, so let's unpack it. It looks like a chained reference, similar to what we saw before. But it's not. The first part, `arr[0]`, is element reference and returns the inner array `[1, 3]`. The second part, `[1] = 5`, is the same as `[1, 3][1] = 5`, which is array element update, not reference. The line `[1, 3][1] = 5` says "change the second element in the array `[1, 3]` to `5`." And as we saw above, this is a destructive action, so the change is permanent. So it's a chained action, but the first part of that chain is element reference, while the second part of that chain is element update.

The first inner array is now permanently changed (note that the first array's second element is changed to `5` from the previous value of `3`).
```Ruby
arr # => [[1, 5], [2]]
```
Before moving on from this section, let's next study how to insert an additional element into an innter array. The idea is similar to the above example: we have to chain element reference with appending an element.
```Ruby
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```
The line `arr[0] << 3` is again a two part chain: the first part, `arr[0]` is element reference and returns `[1]`; and the second part can be thought of as `[1] << 3`, which destructively appends `3` into the inner array.

Or we can also add another array instead of an integer.

```Ruby
arr = [[1], [2]]

arr[0] << [3]
arr # => [[1, [3]], [2]]
```
That leaves us with a three-layer nested data structure.

### Other nested structures

Arrays aren't the only data structure thta can be nested. Hashes can be nested within an array as well.  Let's study a simple example of that.

```Ruby
[{a: 'ant'}, {b: 'bear'}]
```
Let's suppose we want to add a new key/value pair into the first inner hash. Once again, there has to be a two step process: first, reference the first element in the array; next, update the hash.
```Ruby
arr = [{a: 'ant'}, {b: 'bear'}]
arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat"}, {:b => "bear"}]
```
Hopefully I can receognize the pattern by now. First we use `arr[0]` to retrieve the first inner hash, so we get `{a:'ant'}`. Next, we use the normal hash key/value creation syntax to create a new key/value pair: `{a: 'ant'}[:c] = 'cat'`. The change is destructive, so the array, `arr`, reflects the change when we inspect it.

As we know, arrays can contain any type of Ruby object. This means that arrays can hold multiple different objects at the same time, including nested data structures. Let's take a look at an example and retrieve a few elements from it.

```Ruby
arr = [['a', ['b']], {b: 'bear', c: 'cat'}, 'cab']
arr[0]        # => ['a', ['b']]
arr[0][1][0] # => 'b'
arr[1]      # => {b: 'bear', c: 'cat'}
arr[1][:b]  # => 'bear'
arr[1][:b][0] # => 'b'
arr[2][2]   # => 'b'
```
### Variable reference for nested collections

One common confusing aspect when working with nested collections is when variables are referencing inner collectiosn directly. Let's study some code.

```Ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```
The local variables `a` and `b` are pointing to `Array` objects. When we place the local variables as elements in an array, it looks like the same as adding the actual `Array` objects that they're pointing to into the array. And that's true to a certain extent, but there are some edge cases we need to think about. More importantly, we need to extablish a working mental model of how the addition of variable reference affects the data in our nested collections.

For example, what happens if we modify `a` after placing it in `arr`?
```Ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

a[1] = 5
arr # => [[1, 5], [2]]
```
Did that do what you expected? It is intuitive that `arr` is changed, too? The value of `arr` changed because `a` still points to the *same `Array` object* that's in `arr`. When we modified it by replacing `3` with `5` we were modifying the `Array` object.

Take a moment to study the following diagram in order to establish a mental model of variables *pointing* to objects.

`a = [1, 3]`     `a` is pointing to `[1, 3]`
`b = [2]`        `b` is pointing to `[2]`
`arr = [a, b]` `arr` is pointing to `[1, 3]` <-- `a`
                     is pointing to `[2]` <-- `b`
`a[1] = 5`     `arr` is pointing to `[1, 5]` <-- `a`
                     is pointing to `[2]`    <-- `b`

What if we modify the first array in `arr`? Is it different than modifying `a` directly?
```Ruby
arr[0][1] = 8
arr # => [[1, 8], [2]]
a   # => [1, 8]
```
It produces the same result as modifying `a` directly. Why is that? In both cases, we're modifying the *object* that `a` and `arr[0]` point to; we now have two ways to reference the *same object*. In the first example, the object is being modified through `a`. In the second example, the object is being modified through `arr[0]`.

As can be seen in the diragram below, `a` and `arr[0]` are in fact two different ways of referencing the *same object*. The assignment `arr[0][1] = 8` would be the same as `a[1] = 8`.

It's really important to understand variables as pointers, as this is a key fundamental concept. To gain clearer understanding read [Variables as Pointers].(https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)

### Shallow Copy
Sometimes you'll find yourself in need of copying an entire collection, mostly when we want to save the original collection before performing some major modifications. Ruby provides two methods that let us copy an object, including colections: `dup` and `clone`. Both of these methods create a *shallow copy* of an object. This means that only the object that the method is called on is copied. If the object contains other objects - like a nested array - then those objects will be *shared*, not copied. This has major impact to nested collections.

`dup` allows objects within the copied object to be modified.
```Ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]
```
`clone` works the same way.
```Ruby
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]
```
I noticed that in both of the above examples *both* `arr1` and `arr2` are changed. This might not automatically fit in with what you would assume these methods *should* do, given their names.

It's important to understand that the reason this happens is because the destructive methods (`String#upcase!` and `String#reverse!`) were called on the object *within* the array rather than the array itself. Since, as we've already covered, those objects are *shared*, even if I mutate that object by referencing if from within a particular array or other collection it is the object you are affecting rather than the collection.

Consider the following examples:

Example 1
```Ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```
Example 2
```Ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```
IN the first example `arr2` is changed but `arr1` is not. Here, we call the destructive method `Array#map!` on `arr2`; this method modifies the array, replacing each element of `arr2` with a new value. Since we are changing the Array, not the elements within it, `arr1` is left unchanged.

IN the second exmple, both `arr1` and `arr2` are changed. Here, we call the destructive `String#upcase!` method on each *element* of `arr2`. However, every element of `arr2` is a reference to the object referenced by the corresponding element in `arr2`, `arr1` is also affected; we change the Array elements, not the Array.

The important thing to be aware of is *exactly* what level you're working at, especially when working with nested collections and using variables as pointers; are you working at the level of an outer array or hash, or at the level of an object within that?

### Freezing Objects

The main difference between `dup` and `clone` preserves the frozen state of the object.

```Ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array
```
`dup` doesn't preserve the frozen state of the object.

```Ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```
What is freezing? In Ruby, objects can be frozen in order to prevent them from being modified.
```Ruby
str = "abc".freeze
str << "d"
# => Runtime Error: can't modify frozen String
```
Only mutable objects can be frozen because immutable objects, like integers, are already frozen. We can check if an object if frozen with the `frozen?` method.
```5.frozen? # => true`
What does `freeze` actually freese? `freeze` only freezes the object it's called on. If the object it's called on contains other objects, those objects won't be frozen. For example, if we have a nested array the nested objects can still be modified after calling `freeze`.

```Ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```
This also applies to strings within an array.

```Ruby
arr = ["a", "b", "c"].freeze
arr[2] << "d"
arr # => ["a", "b", "cd"]
```
### Deep Copy
In Ruby, there's no built-in or easy way to create a deep copy or deep freeze objects within objects. There are various ways of implementing such functionality but that's beyond the scope of this lesson. It is important therefore to really be aware of is the level within the collection at which you are working.

## Summary
By taking the time to learn how nested data structures work, and what it means to copy an object with `dup` or `clone`, we're able to further clarify our understanding of collections and how to work with them. The deeper our knowledge is on a concept the easier it will be to implement solutions using that concept.

In this assigment, we looked at examples which illustrated how nested data structures work and the syntax needed in order to mainulate them as needed. We also looked at how to copy an object and what freezing means. At this point you should have a very clear understanding of how to work with collections. This means that you're comfortable with complicated data structures and how to mainipulate them to fit your needs. In the next assignment we'll look at combining all of the concepts we've learned about so far in this lesson. 