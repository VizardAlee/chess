# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def possible_moves
    # king moves one square in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2654}"
    when 'black'
      "\u{265A}"
    else
      puts "#{color} not valid"
    end
  end

  def move(board, row, col)
    row1, col1 = position

    possible_moves.each do |coordinate|
      row2, col2 = coordinate
      if !board.out_of_bounds?(row, col) && board.grid[(row1 + row2)][(col1 + col2)] == board.grid[row][col]
        board.grid[row][col] = color
        update_position(row, col)
        return true
      end
      # return board.grid[row][col] = color if board.grid[(row1 + row2)][(col1 + col2)] == board.grid[row][col]
    end
    puts 'Invalid Move'
    return false
  end
end
