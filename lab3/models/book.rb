# frozen_string_literal: true

# book - an element in a booklist
class Book
  def initialize(name, date, book)
    @name = name
    @date = Date.parse(date)
    @book = book
  end
  attr_accessor :date, :name, :book
end
