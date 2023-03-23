# frozen_string_literal: false

require_relative 'pieces'

# rook class
class Rook < ChessPiece
  def moveable?(board, row, col)
    super
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs
    return false unless obstructed?(board, row, col) == false

    unless (delta_x.zero? && delta_y >= 1) || (delta_x >= 1 && delta_y.zero?)
      puts 'wrong move bro!'
      return false
    end
    true
  end

  def move_piece(board, row, col)
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if (delta_x.zero? && delta_y >= 1) || (delta_x >= 1 && delta_y.zero?)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
    else
      puts 'Invalid move'
      false
    end
  end

  def castling
    case color
    when 'white'
      if position == [7, 0] || position == [7, 7]
        @castle = true
        return true
      end
    when 'black'
      if position == [0, 0] || position == [0, 7]
        @castle = true
        return true
      end
    end
    false
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
