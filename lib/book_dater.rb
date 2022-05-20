# frozen_string_literal: true

def date_book(book, book_data)
  date = book_data.published_date.gsub('-', '')
  puts "Published: #{book_data.published_date}"
  timestamp = if book_data.published_date.length > 4
                "#{date}0101"
              else
                "#{date}01010101"
              end
  system "touch -t #{timestamp} '#{book}'"
end
