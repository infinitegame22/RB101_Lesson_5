arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr1.flatten.last
# arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr2[1] => {:third=>["g", "h", "i"]} 
# arr2[1][:third] => ['g', 'h', 'i']
# arr2[1][:third][0] => 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}]

# arr3[2]  => {:third=>["ghi"]} 
# arr3[2][:third] => ['ghi']
# arr3[2][:third][0][0] => 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh1['b'] => ['f', 'g']
# hsh1['b'][1] => 'g'

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# hsh2[:third].keys.select { |element| element == 'g' }.first