# frozen_string_literal: false

require_relative 'pieces'

# knight class
class Knight < ChessPiece
  def possible_moves
    # knight moves in L shapes
    [[-2, -1], [-2, 1], [1, 2], [-1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]]
  end

  def move(board, row, col)
    if board.in_bound?(row, col)
      row1, col1 = position
      row2 = row
      col2 = col
      delta_x = (row1 - row2).abs
      delta_y = (col1 - col2).abs
      if (delta_x == 1 && delta_y == 2) || (delta_x == 2 && delta_y == 1)
        update_position(row2, col2)
        board.grid[row1][col1] = '-'
        board.grid[row2][col2] = self
        true
      else
        puts 'Invalid move'
        false
      end
    else
      puts 'Out of bounds!'
      false
    end
  end

  def to_s
    case @color
    when 'white'
      "\u{2658}"
    when 'black'
      "\u{265E}"
    else
      raise "#{color} not valid"
    end
  end
end
