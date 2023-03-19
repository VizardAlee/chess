# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def move_piece(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if board.in_bound?(row, col)
      if check_opposition(board, row, col) == true
        move_condition(board, row, col, delta_x, delta_y)
        true
      else
        puts 'That is you comrade'
        return false
      end
    else
      puts 'Out of bounds'
      return false
    end
  end

  def move_condition(board, row, col, delta_x, delta_y)
    in_row, in_col = position
    if (delta_x == 1 && delta_y == 1) || (delta_x.zero? && delta_y == 1) || (delta_x == 1 && delta_y.zero?)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
    else
      puts 'Invalid move'
      return false
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
