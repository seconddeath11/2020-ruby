# frozen_string_literal: true

require_relative 'C:\Users\novik\.vscode\2020-ruby\lab2\lib\pupilList.rb'
require 'tty-prompt'
def main
  list = PupilList.new
  list.read('C:\Users\novik\.vscode\2020-ruby\lab2\data\test_results.csv')
  tty(list)
end

def tty(list)
  menu_choices = [
    { name: 'Список двоечников', value: :twos },
    { name: 'Статистика по классам',
      value: :stat },
    { name: 'Проверить на списывание', value: :spis },
    { name: 'Найти самые сложные вопросы', value: :tough },
    { name: 'Изменить оценки', value: :new_grades }
  ]
  prompt = TTY::Prompt.new
  action = prompt.select('Выберите действие', menu_choices)
  if action == :new_grades
    fives = prompt.ask('Fives:')
    fours = prompt.ask('Fours:')
    threes = prompt.ask('Threes:')
    list.change_marks(fives, fours, threes)
  end
  list.twos if action == :twos
  list.find_bad if action == :spis
  list.each_by_class if action == :stat
end
main if __FILE__ == $PROGRAM_NAME
