# frozen_string_literal: false

# pawn class
class Pawn
  def possible_moves
    # king moves one square in any direction
    [[-1, 0]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2659}"
    when 'black'
      "\u{265F}"
    else
      puts "#{color} not valid"
    end
  end
end
