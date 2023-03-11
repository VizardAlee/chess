# frozen_string_literal: false

# piece class
class ChessPiece
  attr_accessor :position
  attr_reader :color

  # common characteristics chess pieces have include:
  # checking if path is obstructed
  # moving piece from one point to the other
  # updating piece position
  # color attribute
  # being able to take out oposition piece
  # can be taken out by oposition piece

  def initialize(color, row = nil, col = nil)
    @color = color
    @position = [row, col]
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
