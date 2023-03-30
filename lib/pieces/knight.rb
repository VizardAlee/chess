# frozen_string_literal: false

require_relative 'pieces'

# knight class
class Knight < ChessPiece
  def moveable?(board, row, col)
    super

    if position == [nil, nil]
      puts "#{self.class} has been eliminated!"
      return false
    end

    return true if board.grid[row][col].instance_of?(King) && board.grid[row][col] != color

    if board.grid[row][col] == color && board.grid[row][col] != '-'
      puts 'friendly fire'
      return false
    end

    arr = [0, 1, 2, 3, 4, 5, 6, 7]
    if arr.none? { |val| val == row } || arr.none? { |val| val == col }
      puts 'Invalid row value'
      return false
    end

    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs
    unless (delta_x == 2 && delta_y == 1) || (delta_x == 1 && delta_y == 2)
      puts 'wrong move bro'
      return false
    end

    true
  end

  def move_piece(board, row, col)
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if (delta_x == 2 && delta_y == 1) || (delta_x == 1 && delta_y == 2)
      eliminate(board, row, col)
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
      "\u{2658}"
    when 'black'
      "\u{265E}"
    else
      raise "#{color} not valid"
    end
  end
end
