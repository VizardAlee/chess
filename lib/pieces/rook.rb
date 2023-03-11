# frozen_string_literal: false

require_relative 'pieces'

# rook class
class Rook < ChessPiece
  def possible_moves
    # rook moves in any number of squares in vertically or horizontally
    [[-1, 0], [0, 1], [1, 0], [0, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2656}"
    when 'black'
      "\u{265C}"
    else
      raise "#{color} not valid"
    end
  end
end
