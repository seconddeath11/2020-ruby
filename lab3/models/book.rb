# frozen_string_literal: true

# book
class Book
  def initialize(name, date, book)
    @name = name
    @date = Date.parse(date)
    @book = book
  end
end
