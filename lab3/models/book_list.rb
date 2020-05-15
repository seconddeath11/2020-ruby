# frozen_string_literal: true

require 'forwardable'

# list of books
class BookList
  extend Forwardable
  def_delegator :@books, :each

  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.append(book)
  end

  def all_books
    @books.dup
  end

  def sort
    @books.sort_by(&:date).reverse
  end

  def filter_years
    years = []
    @books.each do |book|
      years.append(book.date.year) unless years.include?(book.date.year)
    end
    years
  end

  def by_year(year)
    list = BookList.new
    @books.each do |book|
      list.add_book(book) if book.date.year == year
    end
  end
end
