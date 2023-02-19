# frozen_string_literal: false

require_relative 'pieces'

# rook class
class Rook < ChessPiece
  def possible_moves
    # rook moves in any number of squares in vertically or horizontally
    [[-1, 0], [0, 1], [1, 0], [0, -1]]
  end

  def move(board, row2, col2)
    row1, col1 = position
    delta_x = (row1 - row2).abs
    delta_y = (col1 - col2).abs

    if board.in_bound?(row2, col2) && (delta_x.zero? || delta_y.zero?)
      if obstructed?(board, row1, col1, row2, col2) == false
        update_position(row2, col2)
        board.grid[row2][col2] = self
        true
      else
        puts 'Path is obstructed'
        false
      end
    else
      puts 'Invalid move'
      false
    end
  end

  def to_s
    case @color
    when 'white'
      "\u{2656}"
    when 'black'
      "\u{265C}"
    else
      raise "#{color} not valid"
    end
  end
end
