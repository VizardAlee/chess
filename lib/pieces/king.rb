# frozen_string_literal: false

# king class
class King
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def to_s
    case @color
    when 'white'
      "\u{2654}"
    when 'black'
      "\u{265A}"
    else
      puts "#{color} not valid"
    end
  end
end
