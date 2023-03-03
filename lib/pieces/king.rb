# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def possible_moves
    # king moves one square in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def move(board, row, col)
    if position == [nil, nil]
      puts "#{self} has been taken"
      return false
    end

    row1, col1 = position
    row2 = row
    col2 = col
    delta_x = (row2 - row1).abs
    delta_y = (col2 - col1).abs

    raise 'Invalid move' if delta_x > 1 || delta_y > 1

    board.grid[row1][col1] = '-'
    board.grid[row][col] = self
    update_position(row, col)
  end

  def to_s
    case @color
    when 'white'
      "\u{2654}"
    when 'black'
      "\u{265A}"
    else
      raise "Invalid color: #{@color}"
    end
  end
end
