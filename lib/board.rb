# frozen_string_literal: false

require_relative './pieces/king'
require_relative './pieces/queen'

# board class
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '-') }
  end

  def layout
    puts '  a b c d e f g h'
    puts '  ----------------'
    grid.each_with_index do |row, num|
      print 8 - num, '|'
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