# frozen_string_literal: false

require_relative './pieces/king'
require_relative './pieces/queen'
require_relative './pieces/rook'
require_relative './pieces/bishop'
require_relative './pieces/knight'
require_relative './pieces/pawn'

# create player
class Player
  attr_reader :name, :pieces
  attr_accessor :king, :queen, :rook, :bishop, :knight, :pawn

  def initialize(name, color)
    @name = name
    @color = choose_piece(color)
    @pieces = %i[king queen rook bishop knight pawn]
  end

  def choose_piece(color)
    case color
    when 'white'
      initiate_whites
    when 'black'
      initiate_blacks
    else
      RuntimeError 'Choose a valid color! "white" or "black"?'
    end
  end

  def initiate_whites
    @king = King.new('white')
    @queen = Queen.new('white')
    @rook = Rook.new('white')
    @bishop = Bishop.new('white')
    @knight = Knight.new('white')
    @pawn = Pawn.new('white')
  end

  def initiate_blacks
    @king = King.new('black')
    @queen = Queen.new('black')
    @rook = Rook.new('black')
    @bishop = Bishop.new('black')
    @knight = Knight.new('black')
    @pawn = Pawn.new('black')
  end
end
