# frozen_string_literal: false

# piece class
class ChessPiece
  attr_accessor :position
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def update_position(row, col)
    unless row.is_a?(Integer) && col.is_a?(Integer)
      raise ArgumentError, 'Position must be specified as [row, col] where both are integers'
    end
    @position = row, col
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
end
