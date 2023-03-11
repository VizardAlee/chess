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
end
