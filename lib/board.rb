# frozen_string_literal: false

# board class
class Board
  def initialize
    @board = Array.new(8) { Array.new(8, '-') }
  end
end
