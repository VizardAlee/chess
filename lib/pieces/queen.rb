# frozen_string_literal: false

# queen class
class Queen
  def possible_moves
    # king moves in any number of squares in any direction
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def to_s
    case @color
    when 'white'
      "\u{2655}"
    when 'black'
      "\u{265B}"
    else
      puts "#{color} not valid"
    end
  end
end
