# frozen_string_literal: false

require_relative 'pieces'

# pawn class
class Pawn < ChessPiece
  def possible_moves
    # pawn moves one square farward
    # cannot reverse or move sideways
    # can only take opponnent pieces in diagonal positions one step ahead of it
    # first move can grant it two steps forward, if there are no obstructions
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
