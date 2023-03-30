# frozen_string_literal: false

require_relative 'pieces'

# queen class
class Queen < ChessPiece
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
    return false unless obstructed?(board, row, col) == false

    unless (delta_x - delta_y).abs.zero? || (delta_x.zero? && delta_y >= 1) || (delta_x >= 1 && delta_y.zero?)
      puts 'wrong move bro!'
      return false
    end
    true
  end

  def move_piece(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if (delta_x - delta_y).abs.zero? || (delta_x.zero? && delta_y >= 1) || (delta_x >= 1 && delta_y.zero?)
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
      "\u{2655}"
    when 'black'
      "\u{265B}"
    else
      raise "#{color} not valid"
    end
  end
end
