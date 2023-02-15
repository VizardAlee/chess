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

  def move(board, row, col)
    row1, col1 = position

    # ensure the destination is within one square in any direction
    if (row1 - row).abs <= 1 && (col1 - col).abs <= 1 && board.out_of_bounds?(row, col) == false
      board.grid[row][col] = self
      board.grid[row1][col1] = '-'
      update_position(row, col)
    else
      puts 'invalid move'
    end
  end
end
