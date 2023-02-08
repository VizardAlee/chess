# frozen_string_literal: false

# frozen_string_literal: false

# frozen_string_literal: false

# Bishop class
class Bishop
  attr_accessor :color

  def initialize(color)
    @color = color
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
