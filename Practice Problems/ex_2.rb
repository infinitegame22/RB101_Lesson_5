# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# arr.sort do |a, b|
#   a.to_i <=> b.to_i #ascending
#   b.to_i <=> a.to_i # descending, use `a` (start) and `z` (end)
# end
puts books
books.sort! do |hash1, hash2|
  hash1[:published].to_i <=> hash2[:published].to_i
end

puts books

books.sort_by do |book|
  book[:published]
end

=begin
input: array
output: array

sorted by the published year oldest to youngest
to access properties of the hash - pass it the key `:published`
books[:published].sort
=end