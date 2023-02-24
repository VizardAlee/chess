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
  attr_accessor :king, :queen, :rook1, :rook2, :bishop1, :bishop2, :knight1, :knight2, :pawn1, :pawn2, :pawn3, :pawn4, :pawn5, :pawn6, :pawn7, :pawn8

  def initialize(name, color)
    @name = name
    @color = choose_piece(color)
    @pieces = %i[king queen rook1 rook2 bishop1 bishop2 knight1 knight2 pawn1 pawn2 pawn3 pawn4 pawn5 pawn6 pawn7 pawn8]
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
    @rook1 = Rook.new('white')
    @rook2 = Rook.new('white')
    @bishop1 = Bishop.new('white')
    @bishop2 = Bishop.new('white')
    @knight1 = Knight.new('white')
    @knight2 = Knight.new('white')
    @pawn1 = Pawn.new('white')
    @pawn2 = Pawn.new('white')
    @pawn3 = Pawn.new('white')
    @pawn4 = Pawn.new('white')
    @pawn5 = Pawn.new('white')
    @pawn6 = Pawn.new('white')
    @pawn7 = Pawn.new('white')
    @pawn8 = Pawn.new('white')
  end

  def initiate_blacks
    @king = King.new('black')
    @queen = Queen.new('black')
    @rook1 = Rook.new('black')
    @rook2 = Rook.new('black')
    @bishop1 = Bishop.new('black')
    @bishop2 = Bishop.new('black')
    @knight1 = Knight.new('black')
    @knight2 = Knight.new('black')
    @pawn1 = Pawn.new('black')
    @pawn2 = Pawn.new('black')
    @pawn3 = Pawn.new('black')
    @pawn4 = Pawn.new('black')
    @pawn5 = Pawn.new('black')
    @pawn6 = Pawn.new('black')
    @pawn7 = Pawn.new('black')
    @pawn8 = Pawn.new('black')
  end
end
