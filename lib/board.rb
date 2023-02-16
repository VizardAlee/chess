# frozen_string_literal: false

# board class
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '-') }
  end

  def in_bound?(row, col)
    row >= 0 && row < 8 && col >= 0 && col < 8 ? true : false
  end

  def layout
    puts '  0 1 2 3 4 5 6 7'
    puts '  ----------------'
    grid.each_with_index do |row, num|
      print 0 + num, '|'
      row.each do |col|
        if col.nil?
          print ' '
        else
          print "#{col} "
        end
      end
      puts '|'
    end
    puts '  ----------------'
  end
end

board = Board.new
board.layout
p board.in_bound?(0, 0)
