
[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end

[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end
Line  Action  Object  Side Effects: :Return value :Return value used?:
1 method map is called  multi-dimensional array     1
# Return 

def defecate 
  arr = ["waste", "matter"]
  puts "*FART*" 
  arr
end 


```Ruby
[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr| # 1
  sub_arr.map do |letter|                             # 2
    letter.upcase                                     # 3
  end
end
```



| **Line** | **Action** | **Object** | **Side Effects:** | **:Return value** | **:Return value used?:** | 
--- | --- | --- | --- | --- | --- | 
| 1 | method `map` is called | multi-dimensional array |None|new array|No|
| 2 | method `map` is called | sub array | None | new array | No |


```Ruby
gangsta_d = [1,2,3].map do |yeet|
  nil 
end 

p gangsta_d #=> [nil, nil, nil]

p (["Amy", "Jake", "Finn"].map do |name|
  !name 
end )
```

map is using the return value of the block to transform the elements of the array. map transforms element and assigns it to new array. 

```Ruby
[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr| # 1
  sub_arr.map do |letter|                             # 2
    letter.upcase                                     # 3
  end
end

['c', 'd'].map do |letter|                             # 2
    letter.upcase                                     # 3
  end

  [['A', 'B'], ['C', 'D'], ['E', 'F']]

```