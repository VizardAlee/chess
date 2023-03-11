# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def possible_moves
    # king moves one square in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def move(board, row, col)
    if board.in_bound?(row, col)
      check_opposition(board, row, col)
    else
      puts 'Out of bounds'
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
