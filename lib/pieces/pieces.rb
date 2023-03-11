# frozen_string_literal: false

# piece class
class ChessPiece
  attr_accessor :position
  attr_reader :color

  def initialize(color, row = nil, col = nil)
    @color = color
    @position = [row, col]
  end

  def move(board, row, col)
    if board.in_bound?(row, col)
      check_opposition(board, row, col)
    else
      puts 'Out of bounds'
      false
    end
  end

  private

  def update_position(row, col)
    @position = [row, col]
  end

  def check_opposition(board, row, col)
    if board.grid[row][col] == '-' || board.grid[row][col].color != color
      board.grid[row][col] = self
      update_position(row, col)
    else
      puts 'Position occupied by your piece'
      false
    end
  end

  def obstructed?(board, in_row, in_col, row, col, delta_x, delta_y)
    direction_x = delta_x.positive? ? (row - in_row) / delta_x : 0
    direction_y = delta_y.positive? ? (col - in_col) / delta_y : 0
    (1..[delta_x, delta_y].max - 1).each do |i|
      pos_x = in_row + i * direction_x
      pos_y = in_col + i * direction_y
      if board.grid[pos_x][pos_y] != '-'
        puts "Obstruction detected at [#{pos_x}, #{pos_y}]"
        return true
      end
    end
  end
end
