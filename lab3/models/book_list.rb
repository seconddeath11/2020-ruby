# frozen_string_literal: true

require 'forwardable'

# list of books
class BookList
  extend Forwardable
  def_delegator :@books

  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.append(book)
  end

  def all_books
    @books.dup
  end
end
