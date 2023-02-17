# frozen_string_literal: false

require_relative 'pieces'

# queen class
class Queen < ChessPiece
  def possible_moves
    # queen moves in any number of squares in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def move(board, row, col)
    row1, col1 = position
    row2 = row
    col2 = col
    delta_x = (row1 - row2).abs
    delta_y = (col1 - col2).abs
    if delta_x.zero? || delta_y.zero? || delta_x == delta_y && board.in_bound?(row2, col2)
      if obstructed?(board, row1, col1, row2, col2) == false
        update_position(row2, col2)
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

  def obstructed?(board, row1, col1, row2, col2)
    x_dir = col2 <=> col1
    y_dir = row2 <=> row1

    row = row1 + y_dir
    col = col1 + x_dir

    while [row, col] != [row2, col2]
      return true if board.grid[row][col] != '-'

      row += y_dir
      col += x_dir
    end
    false
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
