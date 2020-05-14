# frozen_string_literal: true

# Validators for the incoming requests
module Validator
  def self.check_date_format(date)
    if /\d{4}-\d{2}-\d{2}/ =~ date
      []
    else
      ['Дата должна быть передана в формате ГГГГ-ММ-ДД']
    end
  end

  def self.check_name(name)
    if name.empty?
      ['Имя автора не может быть пустым']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Дата не может быть пустой']
    else
      []
    end
  end

  def self.check_date_month(date)
    month = date.split('-')[1].to_i
    if month < 12 && month.positive?
      []
    else
      ['Такого месяца не существует']
    end
  end

  def self.check_date_day(date)
    day = date.split('-')[2].to_i
    if day < 31 && day.positive?
      []
    else
      ['Такого дня не существует']
    end
  end
end
