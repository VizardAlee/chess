# frozen_string_literal: false

require_relative 'board'
require_relative 'player'
require_relative 'prep'

# bringing things together
class Game
  attr_accessor :board, :p1, :p2, :player1, :player2, :whites, :blacks

  def initialize
    @board = Board.new
    @p1 = []
    @p2 = []
    player_start
    assemble
    @moved = false
  end

  def player_start
    puts 'Your name player 1'
    p1 << gets.chomp
    puts 'Your name player 2'
    p2 << gets.chomp
    @player1 = Player.new(p1.first, 'white')
    @player2 = Player.new(p2.first, 'black')
    puts "#{player1.name} Vs #{player2.name}! Let's Goo!!"
  end

  def assemble
    @whites = Prep.new(player1.color)
    @blacks = Prep.new(player2.color)
    @whites.p1_generals_position(board)
    @whites.p1_pawns_position(board)
    @blacks.p2_generals_position(board)
    @blacks.p2_pawns_position(board)
    board.layout
  end

  def white_player_move(piece, row, col)
    case piece
    when 'k'
      whites.king.move_piece(board, row, col)
    when 'q'
      whites.queen.move_piece(board, row, col)
    when 'r1'
      whites.rook1.move_piece(board, row, col)
    when 'r2'
      whites.rook2.move_piece(board, row, col)
    when 'b1'
      whites.bishop1.move_piece(board, row, col)
    when 'b2'
      whites.bishop2.move_piece(board, row, col)
    when 'kn1'
      whites.knight1.move_piece(board, row, col)
    when 'kn2'
      whites.knight2.move_piece(board, row, col)
    when 'p1'
      whites.pawn1.move_piece(board, row, col)
    when 'p2'
      whites.pawn2.move_piece(board, row, col)
    when 'p3'
      whites.pawn3.move_piece(board, row, col)
    when 'p4'
      whites.pawn4.move_piece(board, row, col)
    when 'p5'
      whites.pawn5.move_piece(board, row, col)
    when 'p6'
      whites.pawn6.move_piece(board, row, col)
    when 'p7'
      whites.pawn7.move_piece(board, row, col)
    when 'p8'
      whites.pawn8.move_piece(board, row, col)
    else
      puts 'Invalid  input'
      return false
    end
    @moved = true
  end

  def black_player_move(piece, row, col)
    case piece
    when 'k'
      blacks.king.move_piece(board, row, col)
    when 'q'
      blacks.queen.move_piece(board, row, col)
    when 'r1'
      blacks.rook1.move_piece(board, row, col)
    when 'r2'
      blacks.rook2.move_piece(board, row, col)
    when 'b1'
      blacks.bishop1.move_piece(board, row, col)
    when 'b2'
      blacks.bishop2.move_piece(board, row, col)
    when 'kn1'
      blacks.knight1.move_piece(board, row, col)
    when 'kn2'
      blacks.knight2.move_piece(board, row, col)
    when 'p1'
      blacks.pawn1.move_piece(board, row, col)
    when 'p2'
      blacks.pawn2.move_piece(board, row, col)
    when 'p3'
      blacks.pawn3.move_piece(board, row, col)
    when 'p4'
      blacks.pawn4.move_piece(board, row, col)
    when 'p5'
      blacks.pawn5.move_piece(board, row, col)
    when 'p6'
      blacks.pawn6.move_piece(board, row, col)
    when 'p7'
      blacks.pawn7.move_piece(board, row, col)
    when 'p8'
      blacks.pawn8.move_piece(board, row, col)
    else
      puts 'Invalid  input'
      return false
    end

    @moved = false
  end

  def turn
    until whites.king.position == [nil, nil] || blacks.king.position == [nil, nil]
      case @moved
      when false
        puts 'make a move p1'
        storage = []
        puts 'choose piece'
        storage << gets.chomp
        puts 'choose row'
        storage << gets.chomp.to_i
        puts 'choose column'
        storage << gets.chomp.to_i
        white_player_move(storage.shift, storage.shift, storage.shift)
        board.layout
      when true
        puts 'make a move p1'
        storage = []
        puts 'choose piece'
        storage << gets.chomp
        puts 'choose row'
        storage << gets.chomp.to_i
        puts 'choose column'
        storage << gets.chomp.to_i
        black_player_move(storage.shift, storage.shift, storage.shift)
        board.layout
      end
    end

    white_player_move(storage.shift, storage.shift, storage.shift)
    board.layout
  end
end
