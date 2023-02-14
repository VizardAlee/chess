# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def possible_moves
    # king moves one square in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2654}"
    when 'black'
      "\u{265A}"
    else
      puts "#{color} not valid"
    end
  end
end

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '') }
  end

  def out_of_bounds?(row, col)
    row.negative? || row > grid.length || col.negative? || col > grid.first.length ? true : false
  end
end
