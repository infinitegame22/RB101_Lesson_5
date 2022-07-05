1st assessment - 109
Study guide for written assessment - really good and detailed
Contains lots of articles written by students
Assessment 3 hours long around 20 questions - flys pretty fast
Biggest challenge - time limit, managing to answer every question in time.
Time management strategy - set an alarm at 1 hour, to ping to check and see if needed, technical precision is important
can copy code into editor and run it to receive output
Explain every relevant line of code. 

Interview Assessment - no specific timeline
compeletely different, 2 coding problems
solve both to pass 
1 hour live in front of the interviewer
more difficult, performance anxiety
if 100% alone, 70% with others
explain thought process while coding, no 2-3 minutes of wall of silence. If I need a minute to think about the problem. Make sure the interviewer knows the approach. When typing, don't have to talk as much.
Some sort of problem-solving process - PEDAC recommended
Lesson 4 - high level algortihm
  - It's not Ruby methods, it's just English words
  - implementation details - type them out
  - two loops, different types of methods
  - how to solve it
  - check the test cases in detail
  - not all requirements will be explicit
  - implicit will be obvious in test cases
  - not checking the test cases can lead to failure
  - ask questions of interviewer to clarify something
  - test code in irb
  - documentation not allowed, all problems can be solved by common iteration methods

```Ruby
  [false, false, true].map { |something| "hi" } # => ["hi", "hi", "hi"]

a = ["hi", "hi"]

p a.object_id

b = a.map { |something| "hi"}

p b.object_id

p b

[false, false, true].select { |something| "hi" } # => nil
# => [false, false, true]
```
each, map, select return an array object

DONT SELECT IF "hi" == false || "hi" == nil 
SELECT 

each returns the original one
map and select return the new array object
select returns a new array object populated with all the values from the original array for which the block returned a truthy value (a value that evaluates to true)

Mistakes students make with select
- the element is selected if it is truthy
- if the block returns true (close)
- if the block is truthy (close), actually RETURN value of the block

in each iteration "hi" evaluates to true except false and nil. 

```Ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "mouse"
  break
end

puts animal # => "cat"
puts var # => throw an error
```
initialize (assumes assignment) to "dog"

Variables intialized in the outer scope can be accessible in the inner scope defined by the block, but not vice versa.
Linfe 5 initialize variable in inner scope, can't access in the outer scope.

Variable shadowing - example of variable shadowing
changing the parameter to animal, variables on line 4 and 1, even though they have the same name they are not the same variables.

Learning -
go through the course once, faster than it should be done
start going from the beginning
and mark lessons/exercises as hard/medium/easy
easy means I don't have to review it and I can teach it to someone else. Pretend I am teaching it to someone else. If I can do that, I understand the topic.
Hard- I have no idea, dont understand the concept.
Medium - struggling with some part of it

Later, easy lessons don't need to be reviewed maybe once
Medium - review until they become easy. Includes find same topic outside of the Launch School course. Read it from a different perspective and understand it better.
Hard - find some additional explanation, video, articles, ask questions on forums (Slack). 

Exercises - no more than 30 or 40 minutes per problem
check the solution, try to understand the solution and algorithm in a couple of hours. Next day, try to do the problem from memory and then do the same thing in a few days. 
Algorithms, solving problems is about recognizing patterns. In Capstone, he is dealing with this, students have a hard time stopping to check the solution. Allows to solve more problems. Becomes repetitive. Get exposed to many new things in a short amount of time. In CodeWars, lots of one liners and fancy Ruby methods. Read docs for method. Find a solution that doesn't use one particular method. If solving in a different language, that method may not be available. Learn how to simply solve. 


```Ruby
def test(str)
  str += '!!!' # => str = "Something!!!"
  str.upcase! # => str = "SOMETHING!!!"
end

test_str = "Something"
test(test_str)

puts test_str # =>"Something"
```
We can't explain the method without calling the method.
On line 6 
On line 7 we pass the 
Once we call the method, both 'str' and 'test_str' now point to the same string object.
On line 2 we are reassigning variable `str` to point to a different string objhect.  That means that 'str' and 'test_str' no longer point to the string object so we can no longer mutate the object `test_str` variable points to.
If question asks for line 2 in detail.
Don't have to explain line 3, when it's not possible. Not required to explain them. If it's not relevant, don't explain.

Mistakes
- we mutate variable, we call method on the variable 
ACTUALLY - we are doing them on the object variable points to (references)

Actual, initializing variables, we are reassigning them, and we pass them as the argument to the method call.

First read the question
Explain the question by every relevant line of code.

p [:poop, :poop, :poop].select { |something| "hi" } 