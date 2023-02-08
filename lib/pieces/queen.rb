# frozen_string_literal: false

# queen class
class Queen
  attr_accessor :color

  def initialize(color)
    @color = color
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
