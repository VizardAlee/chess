# frozen_string_literal: false

require_relative './pieces/king'
require_relative './pieces/queen'
require_relative './pieces/rook'
require_relative './pieces/bishop'
require_relative './pieces/knight'
require_relative './pieces/pawn'

# all chess pieces invoked here
class BoardPieces
  attr_accessor :king, :queen, :rook1, :rook2, :bishop1, :bishop2, :knight1, :knight2, :pawn1, :pawn2, :pawn3, :pawn4,
                :pawn5, :pawn6, :pawn7, :pawn8

  def initialize(color)
    @king = King.new(color)
    @queen = Queen.new(color)
    @rook1 = Rook.new(color)
    @rook2 = Rook.new(color)
    @bishop1 = Bishop.new(color)
    @bishop2 = Bishop.new(color)
    @knight1 = Knight.new(color)
    @knight2 = Knight.new(color)
    @pawn1 = Pawn.new(color)
    @pawn2 = Pawn.new(color)
    @pawn3 = Pawn.new(color)
    @pawn4 = Pawn.new(color)
    @pawn5 = Pawn.new(color)
    @pawn6 = Pawn.new(color)
    @pawn7 = Pawn.new(color)
    @pawn8 = Pawn.new(color)
  end
end
