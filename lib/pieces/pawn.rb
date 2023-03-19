# frozen_string_literal: false

require_relative 'pieces'

# pawn class
class Pawn < ChessPiece
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

    if takeable?(board, delta_x, delta_y, row, col)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
    elsif in_row == 1 && color == 'black' || in_row == 6 && color == 'white'
      if (delta_x == 1 && delta_y.zero?) || (delta_x == 2 && delta_y.zero?)
        move(board, row, col)
        board.grid[in_row][in_col] = '-'
      end
    elsif delta_x == 1
      if board.grid[row][col] == '-'
        move(board, row, col)
        board.grid[in_row][in_col] = '-'
      else
        puts 'Invalid move'
        return false
      end
    end
  end

  def takeable?(board, delta_x, delta_y, row, col)
    if ((delta_x - delta_y).zero? && board.grid[row][col] != color) || ((delta_x - delta_y).abs.zero? && board.grid[row][col] != '-')
      true
    else
      return false
    end
  end

  def to_s
    case @color
    when 'white'
      "\u{2659}"
    when 'black'
      "\u{265F}"
    else
      puts "#{color} not valid"
    end
  end
end
