[1] 3.1.1 > "s123123V'".delete('^a-zA-Z')
"sV"
[2] 3.1.1 > "someString".gsub('^a-zA-z', ' ')
"someString"
[3] 3.1.1 > s123123V.gsub('a-zA-z', ' ')
NameError: undefined local variable or method `s123123V' for main:Object
from (pry):3:in `__pry__'
[4] 3.1.1 > 's123123B'.gsub('^a-zA-Z' ' ')
#<Enumerator: "s123123B":gsub("^a-zA-Z ")>
[5] 3.1.1 > 's123123B'.gsub('^a-zA-Z', ' ')
"s123123B"
[6] 3.1.1 > 's123123B'.gsub(/^a-zA-Z/, ' ')
"s123123B"
[7] 3.1.1 > 's123123B'.gsub(/^[a-zA-Z]/, ' ')
" 123123B"
[8] 3.1.1 > 's123123B'.gsub(/[^a-zA-Z]/, ' ')
"s      B"
[9] 3.1.1 > 's123123B'.gsub(/[^a-zA-Z]/, '_')
"s______B"
[10] 3.1.1 > 's123123B'.gsub(/[^a-zA-Z]/, _)
"ss______Bs______Bs______Bs______Bs______Bs______BB"
[11] 3.1.1 > _variable = :soop
:soop
[12] 3.1.1 > _variable 
:soop
[13] 3.1.1 > _variable.to_s 
"soop"
[14] 3.1.1 > 's123123B'.gsub(/[^a-zA-Z]/, '')
"sB"
[15] 3.1.1 > '' + '' 

```Ruby
poop = "!@$%^&*()_+=-`,feces"
new_str = "" 

letters = ('a'..'z').to_a + ('A'..'Z').to_a

p letters.include?('Z0') 

poop.split("").each do |char|
  new_str << char if letters.include?(char)
end

#  | "Amy" | 
#  | "Elf" |
#  | ""    |
p new_str 
# learn how to make sort_by