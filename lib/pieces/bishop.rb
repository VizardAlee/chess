# frozen_string_literal: false

# frozen_string_literal: false

# frozen_string_literal: false

# Bishop class
class Bishop
  def possible_moves
    # Moves moves any number of squares diagonally
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
