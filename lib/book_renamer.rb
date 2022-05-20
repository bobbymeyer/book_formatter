# frozen_string_literal: true

def sanitized_filename(filename)
  filename.gsub(': ', ' - ') # Replace colon with dash
          .gsub(':', ' ')    # Remove remaining colons
          .gsub('/', '-')    # Replace slashes with dashes
          .gsub("'", '')     # Remove single quotes (Messes with Bash Date function)
end

def rename_book(book, book_data)
  authors = book_data.authors.split(",").first(2).join(", ")
  year = book_data.published_date.nil? ? nil : book_data.published_date[0, 4]
  title = book_data.title.split[0...16].join(' ')
  full_title = [title, authors, book_data.publisher, year].compact.join(' - ')
  if full_title.empty?
    book
  else
    filename = sanitized_filename("#{full_title}#{File.extname(book)}")
    File.rename(book, "#{book_directory(book)}/#{filename}")
    "#{book_directory(book)}/#{filename}"
  end
end
