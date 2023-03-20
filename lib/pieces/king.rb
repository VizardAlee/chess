# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def moveable?(board, row, col)
    unless board.in_bound?(row, col)
      puts 'Out of bounds!'
      return false
    end
    unless check_opposition(board, row, col) == true
      puts 'That is you comrade!'
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
