# Working with Blocks

Over the past two lessons we've looked at a number of fundamental concepts related to working with collections, such as iterating, selecting, transforming, sorting, nested collections, and using blocks. In this assignment we'll focus on combining all of these concepts, while taking the time to clearly understand how each component works.  Take your time to analyze each example in this assigment. An example may look very easy or hard, but it probably requires roughly the same effort to understand if you focus on the right details. The goal is to have a deep understanding of how each detail works, not to compelte this assignment as fast as possible.

### Example 1

```Ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# =. [[1, 2], [3, 4]]
```
What happening in this, seemingly simple, piece of code? Take it apart and try to describe every interaction with precision.  Obsession beats talent every time.

The `Array#each` method if being called on the multi-dimensional array `[[1, 2], [3, 4]]`. Each inner array is passed to the block in turn and assigned to the local variable `arr`. The `Array#first` method is called on `arr` and returns the object at index `0` of the current array - in this case the integers `1` and `3`, respectively. The `puts` then outputs a string representation of the integer. `puts` returns `nil` and, since this is the last evaluated statement within the block, the return value of the block is therefore `nil`. `each` doesn't do anything with this returned value though, and since the return value of `each` is the calling object - in this case the nested array `[[1, 2], [3, 4]]` = this is what is ultimately returned. 

That's a lot of stuff going on in just three lines of code! It's pretty difficult to parse all of that in your head at once, and this is a relatively simple example (we'll look at some much more complex ones later in this assignment). It can be helpful to map things out visually in order to keep of what is going on.

What specific pieces of information are we interested in keeping of? When evaluating code like this, ask the following questions: 

- What is the type of action being performed (method call, block, conditional, etc..)?
- What is the object that action is being performed on?
- What is the side-effect of that action (e.g. output or destructive action)?
- What is the return value of that action?
- Is the return value used by whatever instigated the action?

We can take these pieces of information and set them out in a tabular format:

|:**Line**:|:**Action**:|:**Object**:|:**Side Effect**:|:**Return Value**:|
|:1:|:method call (`each`):|:The outer array:|:None:|:The calling object:|:No, but shown on line 6:|
|:1-3:|:block execution:|:Each sub-array:|:None:|:`nil`:|:No:|
|:2:|:method call (`first`):|Each sub-array:|:None:|:Element at index 0 of sub-array:|:Yes, used by `puts`:|
|:method call (`puts`):|:Element at index 0 of sub-array:|:Outputs string representation of an Integer:|:`nil`:|:Yes, used to determine return value of block:|           

## Example 2

Let's take a look at another example.

```Ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```
This example is very similar to the previous example except with one slight variation: `each` is replaced with `map`. At first this may seem like an insignificant change, but when I take a closer look I'll notice the return value of the example is significantly different.

Let's break down this example to see if we can understand the difference:

|:**Line**:|:**Action**:|:**Object**:|:**Side Effect**:|:**Return Value**:|:**Is Return Value Used?:**|
|:1:|:method call (`map`):|:The outer array:|:None:|:New array `[nil, nil]`:|:No, but shown on line 6:|
|:1-3:|:block execution:|:Each sub-array:|:None:|:`nil`:|:Yes, used by `map` for transformation:|
|:2:|:method call (`first`):|:Each sub-array:|:None:|:Element at index 0 of sub-array:|:Yes, used by `puts`:|
|:2:|:method call (`puts`):|:Element at index 0 of each sub-array:|:Outputs a string representation of an Integer:|:`nil`:|:Yes, used to determine return value of block:|

We can see that the change is a result of how `map` handles the return value of the block. Unlike `each`, `map` performs transformation basedo n the return value of the block. This means the last line in the block -- in this case, `puts`-- is critical to understanding this code.

## Example 3
Let's mix it up a little bit and have you try taking apart an example on my own.
```Ruby
[[1, 2], [3, 4]].map do |arr| # => New Array `[1, 3]` - this return value is used by `map` for transformation
  puts arr.first # => method call `first` 
  arr.first
end

# `arr` is a parameter passed to the block to represent the sub-array element.
# method call `first` invoked on each sub-array
#   - RETURN VALUE: element at index 0 of sub-array
#   - USED?: Yes, used by `puts`
# method call `puts` - object means what the call is executing on
#   - RETURN VALUE: `nil`
#   - USED?: No - so sometimes the return value is not used
# method call `first` invoked on each sub-array
#   - RETURN VALUE: element at index 0 of sub-array
#   - USED?: Yes, used to determine the return value of block

=begin
Object is the default root of all Ruby objects. Object inherits from BasicObject which allows creating alternate object hierarchies. Methods on Object are available to all classes unless explicity overridden. Object mixes in the Kernel module, making the built-in kernel functions globally accessible.
https://dev.to/craigbrad/everything-is-an-object-5184


=end

```
Map out a detailed breakdown for the above example using the same approach as the previous two examples. What do I think will be returned?

|:**Line**:|:**Action**:|:**Object**:|:**Side Effect**:|:**Return Value**:|**Is Return Value Used?**:|
|:1:|:method call `map`:|:The outer array:|:None:| New Array `[1, 3]`| No
|1-4|block execution|Each sub-array|None|Integer at index 0 of sub-array|Yes, used by `map` for transformation|
|2|method call (`first`)|Each sub-array|None|Element at index 0 of sub-array|Yes, used by `puts`|
|2|

## Example 4
```Ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

=begin 
line 1 - method call `each`- called on the outer array - return value:  - return value not being used
line 2 - method call `each` - called on the two internal arrays - return value:  - return value used by 
=end
```
There are 4 return values to pay attention to here: the return value of both calls to `each` and the return value of both blocks. When determining what these return values will be it's important to understand how the method used in the example actually works. In this case we're using `each`, which ignores the return value of the block. This lets us quickly see that the value of `my_arr` will be the array that `each` was called on.

Because `each` ignores the block's return value, this was a relatively straight forward example. 

## Example 5

```Ruby

=begin
line 1 - `map` method is invoked on array and passed the parameter `arr` signifying the sub-array.
line 2 - `map` is invoked on each sub-array and passed the parameter `num` signifying each integer element.
line 3 - parameter `num` is multiplied by integer 2
=end
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
What will the return value be in this example? Use what I've learned so far to break it down on my own.

Line 1 - `map` method invoked on array `[[1, 2], [3, 4]]` and passed the parameter of `arr`
Line 2 - `map` method invoked on `arr` parameter and the block is passed the parameter of `num`. First iteration is passed [1, 2] as the first sub-array argument. Second iteration is passed [3, 4] as the second sub-array argument
Line 3 - `num` is multiplied by `2`

1st layer - [[1, 2], [3, 4]]
2nd layer - [1, 2] & [3, 4]
3rd layer - 1, 2, 3, 4

Return value - `[[2, 4], [6, 8]]`

If I look closely and try to understand every line of code, there are actually more than 4 return values I need to pay attention to. The **return value of every expression is important**. I can ignore certain expressions' return values if it's not being used in the code. But more often than not, some implied return value is being used in subtle ways to affect my code. Pay attention to the details.

## Example 6

Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.

```Ruby
[{ a: 'ant', b: 'elephant' }, {c: 'cat'}].select do |hash|
  hash.all? do |key, value| #=> return value is true or false depending on whether it matches the equality expression on line below
    value[0] == key.to_s  #=> `value`'s character at index 0 is equal to `key` symbol converted to a string
  end
end
#=> [{ :c => 'cat' }]
```
All the necessary konwledge I have now to take this apart line by line.
Line 1 - `select` method invoked on array and the block is passed `hash` as a parameter
Line 2 - `all?` invoked on the `hash` argument
  - `all?` returns whether every element meets a given criterion. 
  - With a block given returns whether the block returns a truthy value for every element.
  - " You can think of the parameter as a parking space and the argument as an automobile" https://docs.microsoft.com/en-us/dotnet/visual-basic/programming-guide/language-features/procedures/differences-between-parameters-and-arguments)
  - **P**ARAMETER => **P**LACEHOLDER (This means a placeholder belongs to the function naming and be used in the function body)
  - **A**RGUMENT -> **A**CTUAL VALUE (This means an actual value which is passed by the function calling) 
      https://stackoverflow.com/questions/156767/whats-the-difference-between-an-argument-and-a-parameter?noredirect=1&lq=1
  - Always Remember that: Arguments are passed while parameters are received.

In editing, I'm often put off at how people forget: structure languages are based on natural languages.

## In English

A "parameter" is a placeholder. They set the response format, in spoken language. By definition, it's party to the call, limiting the response.

An "argument" is a position that is being considered. You argue your opinion: you consider an argument.

## Main difference

The thematic role of an argument is agent. The thematic role of parameter is recipient.

## Interactions

Think of the argument as the male part, making the parameter the female part. The argument goes into the parameter.

## Usage

A parameter is usually used in definitions. An argument is usually used in invocations.

## Questions

Finish the sentence to make it less dissonant.

(A) Speaking of a definition:

What argument will be used []?
What [] will this parameter []?
(B) Speaking of an invocation:

What parameter will you use, []?
What [] will be [] this parameter?
Answers

(A)

on/in/against/with this parameter
argument(s) ... take
(B)

and what are some example arguments
argument(s) ... used on/in/against/with
Overlaps

As you can imagine, after answering: in spoken language, these words will sometimes produce identical responses!

So, as a rule:

Usually if someone wants parameter information, they want to know more about the type, the variable name, etc. They may become confused if you only give example arguments.

Usually if someone wants argument information, they want to know what value you passed to a function or its parameter(s).

The first thing to notice here is the use of the `all?` method within the `select` block. Since `#select` specifically cares about the *truthiness* of the block's return value, using a method that returns a boolean works well. `all?` will return `true` if the block passed to it never returns a value of `false` or `nil`for every key/value pair in the hash. We're using `value[0] == key.to_s` to test whether all keys match the first letter of all their associated values. Note that the only hash that meets this criteria is `{:c => 'cat'}`, and the return value is an array.

What would happen if, instead of using `all?`, we used `any?`? Why would this affect the return value of `select`?
  - this would change the return value to be a copy of the original hash since both hashes meet the criteria passed to the method in the block.

### Example 7
Sorting nested data structures can be tricky, and it is important to be clear about the level at which you are sorting and which value I want to use to order my collection.

Say for example we have an array of nested arrays which contain numeric strings, and we want to sort the outer array so that the inner arrays are ordered according to the *numeric* value of the strings they contain. Take, for example, the following 4-element array of arrays.

```Ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
```
We know that we want to sort at the level of the outer array, but we can't simply call `sort` on it. When sorting nested arrays it is important to understand that there are **two** sets of comparison happening:

1. Each of the inner arrays is compared with the other inner arrays.
2. The way those arrays are compared is by comparing the *elements* within them (the documentation refers to this as comparing in an 'element-wise' manner)

Because the elements in the arrays are strings, by calling `sort` it is string order which will ultimately determine array order: 

```Ruby
arr.sort # => [["1", "8", "11"], ["1", "'8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
```
Since strings are compared character by character this doesn't give us a *numerical* comparison. In order to acheive this we have to perform some transformation on the inner arrays prior to comparing them.

```Ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```
What is happening here?

The key here is understanding that when we carry out transformation within a `sort_by` block, the transformed elements are what are then used to perform the comparison. As long as what is returned by the block is comparable, we can perform whatever transformation we need to within the block - including nesting other method calls within it.

In this case, each time the top-level block is called, we call `map` on the sub-array for that iteration, within the `map` block we call `to_i` on each string within that particular sub-array, which returns a new array with integers and leaves the original sub-array unmodified. This ends up sorting the outer array by comparing the transformed integers in the inner arrays, which is what we're looking to do, without any side effects.

```Ruby
