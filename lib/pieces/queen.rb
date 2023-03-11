# frozen_string_literal: false

require_relative 'pieces'

# queen class
class Queen < ChessPiece
  def move_piece(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs
    if (delta_x - delta_y).abs.zero? || delta_x.zero? && delta_y >= 1 || delta_x >= 1 && delta_y.zero?
      unless obstructed?(board, in_row, in_col, row, col, delta_x, delta_y)
        move(board, row, col)
        board.grid[in_row][in_col] = '-'
      end
    else
      puts 'Invalid move'
    end
  end

  def to_s
    case @color
    when 'white'
      "\u{2655}"
    when 'black'
      "\u{265B}"
    else
      raise "#{color} not valid"
    end
  end
end
