# frozen_string_literal: false

require_relative 'pieces'

# queen class
class Queen < ChessPiece
  def possible_moves
    # queen moves in any number of squares in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2655}"
    when 'black'
      "\u{265B}"
    else
      raise "#{color} not valid"
    end
  end
end
