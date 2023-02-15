# frozen_string_literal: false

require_relative 'pieces'

# queen class
class Queen < ChessPiece
  def possible_moves
    # king moves in any number of squares in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2655}"
    when 'black'
      "\u{265B}"
    else
      puts "#{color} not valid"
    end
  end

  def move(board, row, col)
    row1, col1 = position
    begin
      possible_moves.each do |coordinate|
        row2, col2 = coordinate
        if board.grid[(row1 + row2)][(col1 + col2)] == board.grid[row][col]
          board.grid[row][col] = self
          update_position(row, col)
          true
        end
      end
    rescue
      puts 'Invalid Move'
      false
    end
  end
end
