# frozen_string_literal: true

require 'fileutils'

def move_book(book, root_directory)
  processed_dir = "#{root_directory}/Processed"
  FileUtils.mkdir(processed_dir) unless File.directory?(processed_dir)

  FileUtils.move book.to_s, processed_dir
end
