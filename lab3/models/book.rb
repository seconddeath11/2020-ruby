# frozen_string_literal: true

# book - an element in a booklist
class Book
  def initialize(name, date, book, mark, format_, comment)
    @name = name
    @date = Date.parse(date)
    @book = book
    @mark = mark
    @format = format_
    @comment = comment
  end
  attr_accessor :date, :name, :book, :mark, :format
end
