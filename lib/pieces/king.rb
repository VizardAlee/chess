# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def moveable?(board, row, col)
    super
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    unless (delta_x == 1 && delta_y == 1) || (delta_x.zero? && delta_y == 1) || (delta_x == 1 && delta_y.zero?)
      puts 'wrong move bro!'
      return false
    end
    true
  end

  def move_piece(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if (delta_x == 1 && delta_y == 1) || (delta_x.zero? && delta_y == 1) || (delta_x == 1 && delta_y.zero?)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
    else
      puts 'Invalid move'
      false
    end
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
