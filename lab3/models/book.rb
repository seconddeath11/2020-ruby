# frozen_string_literal: true

# book - an element in a booklist
class Book
  def initialize(name, date, book, mark, format_)
    @name = name
    @date = Date.parse(date)
    @book = book
    @mark = mark
    @format = format_
  end
  attr_accessor :date, :name, :book, :mark, :format
end
