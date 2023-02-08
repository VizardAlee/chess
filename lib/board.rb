# frozen_string_literal: false

# board class
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '-') }
  end

  def out_of_bounds?(loc)
    row, col = loc
    row.negative? || row > grid.length || col.negative? || col > grid.first.length ? true : false
  end
  # create conditions to keep moves in-bound
  # create method to get location of pieces
  # display board
end

b = Board.new
p b.out_of_bounds?([2, 3])
p b.grid
