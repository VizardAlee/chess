# frozen_string_literal: false

# knight class
class Knight
  attr_accessor :color

  def initialize(color)
    @color = color
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
