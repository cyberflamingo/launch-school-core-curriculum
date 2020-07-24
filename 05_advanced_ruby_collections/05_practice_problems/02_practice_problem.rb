books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez',
    published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald',
    published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

sorted_books = books.sort do |book_info1, book_info2|
  book_info1[:published].to_i <=> book_info2[:published].to_i
end

puts sorted_books
