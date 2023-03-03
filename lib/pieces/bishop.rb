# frozen_string_literal: false

require_relative 'pieces'

# Bishop class
class Bishop < ChessPiece
  def possible_moves
    [[-1, -1], [-1, 1], [1, 1], [1, -1]]
  end

  def move(board, row2, col2)
    if position == [nil, nil]
      puts "#{self} has been taken"
      return false
    end

    row1, col1 = position
    delta_x = (row1 - row2).abs
    delta_y = (col1 - col2).abs

    if board.in_bound?(row2, col2) && delta_x == delta_y
      if obstructed?(board, row1, col1, row2, col2) == false
        update_position(row2, col2)
        board.grid[row1][col1] = '-'
        board.grid[row2][col2] = self
        true
      else
        puts 'Path is obstructed'
        false
      end
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
