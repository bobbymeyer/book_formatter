# Book Formatter
A simple command-line tool for creating consistently formatted filenames for large collections of PDFs and EPUB files.

The script does the following...
- Looks up the filename on Google Books and pulls publication data: Title(s), Author(s), Publisher and Date Published.
- Santize the Filename to avoid troublesome characters.
- Shortens very long titles.
- Renames the file with the following format "TITLE - AUTHORS - PUBLISHER - YEAR PUBLISHED"
- Changes the file's Date Created timestamp to the publishing date. If only year published is known, it uses 1/1/YEAR.
- Moves the file to a subfolder called "Processed"

Script has some sharp edges and sometimes fails.
Nevertheless, it is far faster and more reliable than doing it by hand.

## Instructions
Drop ebook files into the 'books' directory, and run...
```
ruby book_formatter.rb
```
