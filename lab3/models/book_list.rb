# frozen_string_literal: true

require 'forwardable'

# list of books
class BookList
  extend Forwardable
  def_delegator :@books, :each, :each_with_index

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
    list = Array.new(12, 0)
    @books.each do |book|
      list[book.date.month - 1] += 1 if book.date.year == year.to_i
    end
    list
  end

  def by_format(format)
    @books.select do |book|
      next if (format <=> book.format) != 0

      true
    end
  end
end
