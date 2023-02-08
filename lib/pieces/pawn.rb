# frozen_string_literal: false

# pawn class
class Pawn
  attr_accessor :color

  def initialize(color)
    @color = color
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
