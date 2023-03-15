# frozen_string_literal: false

require_relative 'pieces'

# pawn class
class Pawn < ChessPiece
  def move_piece(board, row, col)
    
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
