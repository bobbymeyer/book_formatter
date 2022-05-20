# frozen_string_literal: true

require 'googlebooks'
def book_directory(book)
  File.dirname(book)
end

def book_filename(book)
  File.basename(book, '.*')
end

def get_potential_matches(book)
  puts '-------------------'
  puts "Looking for matches for..."
  puts book_filename(book)
  puts '-------------------'
  results = GoogleBooks.search(book_filename(book), { count: 9 }).to_a
  results.each_with_index do |result, index|
    puts "#{index + 1}. #{result.title} - #{result.authors}"
  end
  results
end

def choose_from_potential_matches
  puts '-------------------'
  puts 'Choose a match (1-9) or 0 to exit.'
  puts '-------------------'
  begin
    Integer(gets.chomp)
  rescue ArgumentError
    puts 'Invalid choice. Must be a number. 0 to exit.'
    retry
  end
end

def find_book_data(book)
  results = get_potential_matches(book)
  choice = choose_from_potential_matches
  if choice.between?(1, 9)
    results[choice - 1]
  else
    puts "Skipping #{book_filename(book)}"
    false
  end
end
