# frozen_string_literal: false

require_relative 'pieces'

# Bishop class
class Bishop < ChessPiece
  def move_piece(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if board.in_bound?(row, col)
      if check_opposition(board, row, col) == true
        move_condition(board, row, col, delta_x, delta_y)
        true
      else
        puts "#{board.grid[row][col].color} #{board.grid[row][col].class} is your piece"
        false
      end
    else
      puts 'Out of bounds'
      false
    end
  end

  def move_condition(board, row, col, delta_x, delta_y)
    in_row, in_col = position
    if (delta_x - delta_y).abs.zero? && obstructed?(board, in_row, in_col, row, col, delta_x, delta_y) == false
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
      "\u{2657}"
    when 'black'
      "\u{265D}"
    else
      puts "#{color} not valid"
    end
  end
end
