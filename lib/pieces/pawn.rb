# frozen_string_literal: false

require_relative 'pieces'

# pawn class
class Pawn < ChessPiece
  def moveable?(board, row, col)
    # shouldn't pass the turn to other player when move is invalid
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
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    return true if attack(board, row, col) == true

    if in_row == 1 && color == 'black' || in_row == 6 && color == 'white'
      if (delta_x == 1 && delta_y.zero?) || (delta_x == 2 && delta_y.zero?) # first move can be two steps
        move(board, row, col)
        board.grid[in_row][in_col] = '-'
      else
        puts 'Invalid move'
        false
      end
    elsif delta_x == 1 && delta_y.zero? # subsequent moves
      if board.grid[row][col] == '-'
        move(board, row, col)
        board.grid[in_row][in_col] = '-'
      else
        puts 'Invalid move'
        false
      end
    end
  end

  def attack(board, row, col)
    in_row, in_col = @position
    if top_left_right(board, row, col) == true && color == 'white'
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      true
    elsif bottom_left_right(board, row, col) == true && color == 'black'
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      true
    else
      false
    end
  end

  def top_left_right(board, row, col)
    in_row, in_col = @position
    return true if board.grid[in_row + 1][in_col - 1] != color && board.grid[in_row - 1][in_col + 1] != '-' && board.grid[row][col] != color # top left
    return true if board.grid[in_row + 1][in_col + 1] != color && board.grid[in_row - 1][in_col + 1] != '-' && board.grid[row][col] != color # top right

    false
  end

  def bottom_left_right(board, row, col)
    in_row, in_col = @position
    return true if board.grid[in_row - 1][in_col - 1] != color && board.grid[in_row - 1][in_col + 1] != '-' && board.grid[row][col] != color # bottom left
    return true if board.grid[in_row - 1][in_col + 1] != color && board.grid[in_row - 1][in_col + 1] != '-' && board.grid[row][col] != color # bottom right

    false
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
