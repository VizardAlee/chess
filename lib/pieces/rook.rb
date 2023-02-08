# frozen_string_literal: false

# frozen_string_literal: false

# rook class
class Rook
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
      puts "#{color} not valid"
    end
  end
end
