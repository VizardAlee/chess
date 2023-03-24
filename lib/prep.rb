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
  attr_reader :color
  attr_accessor :king, :queen, :rook1, :rook2, :bishop1, :bishop2, :knight1, :knight2, :pawn1, :pawn2,
                :pawn3, :pawn4, :pawn5, :pawn6, :pawn7, :pawn8, :the_new, :pawn_group

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

  def positioning(new_piece, board)
    pawn_group.any? do |piece|
      row = piece.position.first
      col = piece.position.last
      return false unless piece.change == true

      case piece
      when @pawn1
        @pawn1 = new_piece
        @pawn1.move(board, row, col)
      when @pawn2
        @pawn2 = new_piece
        @pawn2.move(board, row, col)
      when @pawn3
        @pawn3 = new_piece
        @pawn3.move(board, row, col)
      when @pawn4
        @pawn4 = new_piece
        @pawn4.move(board, row, col)
      when @pawn5
        @pawn5 = new_piece
        @pawn5.move(board, row, col)
      when @pawn6
        @pawn6 = new_piece
        @pawn6.move(board, row, col)
      when @pawn7
        @pawn7 = new_piece
        @pawn7.move(board, row, col)
      when @pawn8
        @pawn8 = new_piece
        @pawn8.move(board, row, col)
      end
    end
  end

  def castle_check
    return false unless king.castle == true
    return false if rook1.cannot_castle == true || rook2.cannot_castle == true

    case king.color
    when 'white'
      case king.position
      when [7, 6]
        rook2.castle = true
      when [7, 2]
        rook1.castle = true
      end
      return true
    when 'black'
      case king.position
      when [0, 6]
        rook2.castle = true
      when [0, 2]
        rook1.castle = true
      end
      return true
    end
    false
  end

  def move_rook(board)
    case king.color
    when 'white'
      case king.position
      when [7, 6]
        rook2.position = [7, 5]
        board.grid[7][5] = rook2
        board.grid[7][7] = '-'
      when [7, 2]
        rook1.position = [7, 3]
        board.grid[7][3] = rook2
        board.grid[7][0] = '-'
      end
    when 'black'
      case king.position
      when [0, 6]
        rook2.position = [0, 5]
        board.grid[0][5] = rook2
        board.grid[0][7] = '-'
      when [0, 2]
        rook1.position = [0, 3]
        board.grid[0][3] = rook2
        board.grid[0][0] = '-'
      end
    end
  end

  def en_passant_movement(board)
    if pawn1.sepuku(board) == true
      in_row, in_col = @pawn1.position
      @pawn1.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif pawn2.sepuku(board) == true
      in_row, in_col = @pawn2.position
      @pawn2.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif pawn3.sepuku(board) == true
      in_row, in_col = @pawn3.position
      @pawn3.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif @pawn4.sepuku(board) == true
      in_row, in_col = @pawn4.position
      @pawn4.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif @pawn5.sepuku(board) == true
      in_row, in_col = @pawn5.position
      @pawn5.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif @pawn6.sepuku(board) == true
      in_row, in_col = @pawn6.position
      @pawn6.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif @pawn7.sepuku(board) == true
      in_row, in_col = @pawn7.position
      @pawn7.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    elsif @pawn8.sepuku(board) == true
      in_row, in_col = @pawn8.position
      @pawn8.position = [nil, nil]
      board.grid[in_row][in_col] = '-'
    else
      false
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
