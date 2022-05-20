# frozen_string_literal: true

require './lib/book_data'
require './lib/book_renamer'
require './lib/book_dater'
require './lib/book_mover'

book_directory = './books'
books = Dir["#{book_directory}/*.{pdf,epub}"]
books.each do |book|
  book_data = find_book_data(book)
  next if book_data == false
  book = rename_book(book, book_data)
  date_book(book, book_data)
  move_book(book, book_directory)
end
