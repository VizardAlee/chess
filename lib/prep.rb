# frozen_string_literal: false

# prepper is meant to prepare the team on the board
# so I will need board class, player class and all pieces classes

require_relative 'board'
require_relative 'player'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

# assembling all pieces
class Prep
  attr_reader :color, :pawn_group
  attr_accessor :king, :queen, :rook1, :rook2, :bishop1, :bishop2, :knight1, :knight2, :pawn1, :pawn2,
                :pawn3, :pawn4, :pawn5, :pawn6, :pawn7, :pawn8, :the_new

  def initialize(color)
    @color = color
    make_king
    make_queen
    make_rooks
    make_bishops
    make_knights
    make_pawns

    @pawn_group = [@pawn1, @pawn2, @pawn3, @pawn4, @pawn5, @pawn6, @pawn7, @pawn8]
  end

  def make_king
    @king = King.new(color)
  end

  def make_queen
    @queen = Queen.new(color)
  end

  def make_rooks
    @rook1 = Rook.new(color)
    @rook2 = Rook.new(color)
  end

  def make_bishops
    @bishop1 = Bishop.new(color)
    @bishop2 = Bishop.new(color)
  end

  def make_knights
    @knight1 = Knight.new(color)
    @knight2 = Knight.new(color)
  end

  def make_pawns
    @pawn1 = Pawn.new(color)
    @pawn2 = Pawn.new(color)
    @pawn3 = Pawn.new(color)
    @pawn4 = Pawn.new(color)
    @pawn5 = Pawn.new(color)
    @pawn6 = Pawn.new(color)
    @pawn7 = Pawn.new(color)
    @pawn8 = Pawn.new(color)
  end

  def p1_generals_position(board)
    @rook1.move(board, 7, 0)
    @knight1.move(board, 7, 1)
    @bishop1.move(board, 7, 2)
    @queen.move(board, 7, 3)
    @king.move(board, 7, 4)
    @bishop2.move(board, 7, 5)
    @knight2.move(board, 7, 6)
    @rook2.move(board, 7, 7)
  end

  def p1_pawns_position(board)
    @pawn1.move(board, 6, 0)
    @pawn2.move(board, 6, 1)
    @pawn3.move(board, 6, 2)
    @pawn4.move(board, 6, 3)
    @pawn5.move(board, 6, 4)
    @pawn6.move(board, 6, 5)
    @pawn7.move(board, 6, 6)
    @pawn8.move(board, 6, 7)
  end

  def p2_generals_position(board)
    @rook1.move(board, 0, 0)
    @knight1.move(board, 0, 1)
    @bishop1.move(board, 0, 2)
    @queen.move(board, 0, 3)
    @king.move(board, 0, 4)
    @bishop2.move(board, 0, 5)
    @knight2.move(board, 0, 6)
    @rook2.move(board, 0, 7)
  end

  def p2_pawns_position(board)
    @pawn1.move(board, 1, 0)
    @pawn2.move(board, 1, 1)
    @pawn3.move(board, 1, 2)
    @pawn4.move(board, 1, 3)
    @pawn5.move(board, 1, 4)
    @pawn6.move(board, 1, 5)
    @pawn7.move(board, 1, 6)
    @pawn8.move(board, 1, 7)
  end

  def make_trans(piece)
    case piece
    when 'q'
      @the_new = Queen.new(color)
    when 'r'
      @the_new = Rook.new(color)
    when 'b'
      @the_new = Bishop.new(color)
    when 'kn'
      @the_new = Knight.new(color)
    end

    @the_new
  end

  def white_position(new_piece, board)
    pawn_group.any? do |piece|
      row = piece.position.first
      col = piece.position.last
      new_piece.update_position(row, col)
      board.grid[row][col] = new_piece
    end
  end

  def parameters(board, color)
    case color
    when 'white'
      p1_generals_position(board)
      p1_pawns_position(board)
    when 'black'
      p2_generals_position(board)
      p2_pawns_position(board)
    end
  end
end
