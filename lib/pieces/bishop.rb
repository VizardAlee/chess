# frozen_string_literal: false

require_relative 'pieces'

# Bishop class
class Bishop < ChessPiece
  def possible_moves
    [[-1, -1], [-1, 1], [1, 1], [1, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2657}"
    when 'black'
      "\u{265D}"
    else
      puts "#{color} not valid"
    end
  end
end
