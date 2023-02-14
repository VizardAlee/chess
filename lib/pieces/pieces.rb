# frozen_string_literal: false

# chess piece class
class ChessPiece
  attr_reader :position, :color

  def initialize(color, position)
    @color = color
    @position = position
  end

  def possible_moves
    raise NotImplementedError, 'Subclasses must  implement this method'
  end
end
