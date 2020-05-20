# frozen_string_literal: true

# Validator for the incoming requests
module Validator
  def self.check(r_name, r_date, r_book, mark, r_format, size, comment)
    name_ = r_name || ''
    date = r_date || ''
    book = r_book || ''
    format = r_format || ''
    errors = [].concat(check_date_format(date)).concat(check_name(name_))
               .concat(check_date(date)).concat(check_date_day(date))
               .concat(check_date_month(date)).concat(check_book(book))
               .concat(check_format(format)).concat(check_size(format, size))
               .concat(check_mark(mark.to_i)).concat(check_comment(comment))
    {
      name: name_, date: date, book: book, mark: mark, format: format,
      errors: errors
    }
  end

  def self.check_date_format(date)
    if date.strip.match(/\d{4}-\d{2}-\d{2}$/)
      []
    else
      ['Date should be in this format: yyyy-MM-dd']
    end
  end

  def self.check_name(name)
    if name.empty?
      ['The name of the author is empty']
    else
      []
    end
  end

  def self.check_book(name)
    if name.empty?
      ['The title of the book is empty']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Date is empty']
    else
      []
    end
  end

  def self.check_date_month(date)
    month = date.split('-')[1].to_i
    if month <= 12 && month.positive?
      []
    else
      ['No such month']
    end
  end

  def self.check_date_day(date)
    day = date.split('-')[2].to_i
    if day <= 31 && day.positive?
      []
    else
      ['No such day']
    end
  end

  def self.check_format(format)
    if format.empty?
      ['The format is empty']
    else
      []
    end
  end

  def self.check_size(format, size)
    if (format == 'audio') && ((!size.split('-')[1].to_i < 60) || (!size.split('-')[2].to_i < 60))
      ['The format is wrong']
    # elsif (format != 'audio') && (size.to_i == 0)
    # ['The format is wrong']
    else
      []
    end
  end

  def self.check_mark(mark)
    if (mark > 10) || mark.negative?
      ['The mark is wrong']
    else
      []
    end
  end

  def self.check_comment(comment)
    if comment.length > 2000
      ['The comment is too big']
    else
      []
    end
  end
end
