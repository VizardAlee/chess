# frozen_string_literal: false

# knight class
class Knight
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
      puts "#{color} not valid"
    end
  end
end
