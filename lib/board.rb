# frozen_string_literal: false

# board class
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '-') }
  end

  def out_of_bounds?(row, col)
    row.negative? || row > grid.length || col.negative? || col > grid.first.length ? true : false
  end

  def place(piece, row, col)
    grid[row][col] = piece unless out_of_bounds?(row, col)
  end
  # display board
end

