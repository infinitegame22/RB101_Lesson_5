# Is Ruby Pass-by-Value or Pass-by-Reference?
by Jey Geethan

## Key Takeaways
- Learn how Ruby internally manages memory for variable allocations
- Understand what happens when variables are passed as method parameters
- Write better Ruby code by understanding how parametr variables are modified

## Before I begin
Before we answer the question in the title, think about if I had given any thought on how parameters are passed around in Ruby. If I had never had, but I have been using Rugby for a while, try to get the answer in my mind now, before I read further.

Readers saying Ruby uses pass by value: they are wrong.
Readers saying it uses pass by reference: they are also wrong.

## Ruby and its essence
In Ruby EVERYTHING is an object. Even the primitive value integer is an object. Variables are nothing but references to objects' memory location. Consider the following:
```Ruby
a = { :message => 'success' }
```
Here `a` is a variable and points to a memory location in Ruby's object space. I can see that by doing this:
```Ruby
2.7.0 :039 > a.object_id
=> 320
```
Remember in Ruby there's an `object_id` for every variable, even for variables having `nil` as their value:
```Ruby
2.7.0 :040 > a = nil
2.7.0 :041 > a.object_id
=> 8
```
The `object_id` is supposed to change everytime the Ruby process is rerun and since memory allocation happens at runtime, it will be different for various runs of the Ruby process.  Anyway, the `object_id` of certain objects like `false`, `true`, `nil`, and integer values is always the same. There is an internal magic in MRI (https://en.wikipedia.org/wiki/Ruby_MRI) that always assigns those values the same object_id but that would be the topic for another article. In any case, you can remember this: `object_id` **always changes for objects that we create, except for `false`, `true`, `nil` and some integers**.

## Heap, stack, what?

If I know [how application (ie, process) memory is allocated].(https://en.wikipedia.org/wiki/Memory_management), I would also know that there are two pools of memory that are used: stack and heap. Stack memory is used to push objects onto the stack during method invocation and to pop them after the method returns, as well as to allocate local variables used in the method call (I am keeping it in bery simple terms). Heap memory is used for dynamic objects - typically a pointer is stored on the stack while the memory is allocated on the heap and eventually freed. A good way to explain this is looking at a C program:
```C
int main() {
  int a = 42;
  int *p;
  p = (int*)malloc(sizeof(int));
  // use p
  free(p);
}
```
This program would approximately create a memory space like this:
https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/48image001-1613727298331.jpg

The stack is populated with the variables a and p in that order. Since `a` contains an integer value, its value is directly stored on the stack. Instead, p is a pointer to the heap and contains a reference to the memory location on the heap. The heap contains the memory block with the actual data.

This is how it typically works in a C program.

Let's explore how this is different in Ruby. The memory space in a Ruby process is stored a little bit differently.  Ruby's memory space consists of two heaps. Please remember I am talking about the MRI version of Ruby (which is built using C) while other versions of Ruby will have different implementations.

https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/39image003-1613727298982.jpg

I can see that there's a managed heap and an unmanaged heap. It would be great to understand what happens inside the managed heap. So let's focus on it for a moment. Also I can see that there's no stack that's being used. I will understand why in a little bit.

Ruby's managed heap consists of pages and each page consists of slots of 40 bytes each. It's easier to explain this using a diagram:

https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/34image005-1613727297995.jpg

Pages are of static size, usually 16kb, and each page contains slots of 40 bytes. So a page contains 407 or 408 slots (why the difference in some cases is for another article). So let's see how pages look.

https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/24image007-1613727299326.jpg

The pages can be full or can be partially used or totally free. The slots are used when objects are allocated.  So when I say `a = 'hello'`, a free slot is found and the value is stored into that slot. Now the slot becomes occupied/used.

https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/17image009-1613727297334.jpg

Now, let's consider the Ruby program -

```Ruby
a = 'hello'
b = {}
c = { message: 'hi' }
d = User.new(email: 'test@test.com', password: 'something random')
```
All these objects are stored in Ruby's managed heap. So variable `a` could point to an `object_id` of let's say 40; `b` could point to the next free slot of `80`; `c` could point to the free slot of `160`; and `d` could point to 240.

I can ask: how is it possible the whole object of class User is stored within 40 bytes? The answer is that it is not stored on the managed heap, but rather its memory is allocated on the unmanaged heap and the corresonding memory location is stored in the managed heap slot instead. So it becomes a reference to the object on the unmanaged heap.

https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/15image011-1613727296859.jpg

The rule of thumb is this: is a value can be stored within the 40B slot, it will be stored tehre. Otherwise, Ruby will allocate memory on the unmanaged heap and store the object there, while its reference will be stored in the slot.

A quick note: Hashes are stored as a slot and the slot contains references to other slots for their k-v pairs. Similarly small arrays are stored in teh slot itself otherwise unmanaged heap is used.

So this is how Ruby's memory allocation happens in a nutshell.

## Reference or Value?

So when I am calling a method in Ruby, the parameters are copied by value from the source variables but they are ultimately references to slots. We can show it this way.

```Ruby
2.7.0 :042 > a = { :message => 'success' }
2.7.0 :043 > a.object_id
  => 340
2.7.0 :044 > def test(val)
2.7.0 :045 >  puts val.object_id
2.7.0 :046 > end
  => :test
2.7.0 :047 > test(a)
340
  => nil
2.7.0 :048 >
```
I can see that the parameter inside the method call also contains the same `object_id` as the outside variable that was passed to it. Both the parameter and the outside variable point to the same slot. 

Does this mean pass by reference? Actually no.

Consider
```Ruby
2.7.0 :052 > a = { :message => 'success' }
2.7.0 :053 > a.object_id
 => 340
2.7.0 :054 > def test(val)
2.7.0 :055 >  val = { :message => 'another value' }
2.7.0 :056 >  puts val.object_id
2.7.0 :057 > end
  => :test
2.7.0 :058 > test(a)
360
  => nil
```
When I am reassigning parameter inside the method, I ma actually allocating a new slot. So the `object_id` actually cahnges to the next free slot (here `360` instead of the actual `340`). What does that mean? The variable, when it's reassigned, is given a new slot and the old slot (`340`) is never changed.

So is this pass by value? Actually no.

Consider this,
```Ruby
2.7.0 :059 > a = { :message => 'success' }
2.7.0 :060 > def test(val)
2.7.0 :061 >  val[:added] = 'yes'
2.7.0 :062 > end
  => :test
2.7.0 :063 > a
  => {:message=>"success"}
2.7.0 :064 > test(a)
  => "yes"
2.7.0 :065 > a
  => {:message=>"success", :added=>"yes"}
```
I can see that the original hash is changed when the variable is modified through the parameter. So why does this happen?

The answer is simple. Ruby copies the slot `object_id` during method invocations to the parameters, but this is a new variable and not a reference to the original variable. Since the new variable points to the same page slot, any modifications I do to this object is also done on the original variable. But when I reassign the parameter variable to a new slot (or object), the original variable is not affected because only the `object_id` of the parameter variable is changed and not the original variable.

https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/articles/ruby-parameter-passing/en/resources/14image013-1613727297668.png

So this is exactly what happens in Ruby. So what is it? Some call is pass by reference value, others call it pass by object reference. But I call it pass by `object_id`. Makes it easier to remember.

Remember: It's **pass by** `object_id`

