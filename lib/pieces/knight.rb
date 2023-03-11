# frozen_string_literal: false

require_relative 'pieces'

# knight class
class Knight < ChessPiece
  def possible_moves
    # knight moves in L shapes
    [[-2, -1], [-2, 1], [1, 2], [-1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2658}"
    when 'black'
      "\u{265E}"
    else
      raise "#{color} not valid"
    end
  end
end
