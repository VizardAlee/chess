# frozen_string_literal: false

# piece class
class ChessPiece
  attr_accessor :position
  attr_reader :color

  def initialize(color, row, col)
    @color = color
    @position = row, col
  end

  def update_position(row, col)
    @position = row, col
  end
end
