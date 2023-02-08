# frozen_string_literal: false

# frozen_string_literal: false

# rook class
class Rook
  attr_accessor :color

  def initialize(color)
    @color = color
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
