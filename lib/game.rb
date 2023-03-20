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
    pieces = {
      'k' => whites.king,
      'q' => whites.queen,
      'r1' => whites.rook1,
      'r2' => whites.rook2,
      'b1' => whites.bishop1,
      'b2' => whites.bishop2,
      'kn1' => whites.knight1,
      'kn2' => whites.knight2,
      'p1' => whites.pawn1,
      'p2' => whites.pawn2,
      'p3' => whites.pawn3,
      'p4' => whites.pawn4,
      'p5' => whites.pawn5,
      'p6' => whites.pawn6,
      'p7' => whites.pawn7,
      'p8' => whites.pawn8
    }

    piece_obj = pieces[piece]
    if piece_obj.nil?
      puts 'Invalid move'
      board.layout
      false
    elsif piece_obj.moveable?(board, row, col) == false
      board.layout
      false
    else
      piece_obj.move_piece(board, row, col)
      @moved = true
      true
    end
  end

  def black_player_move(piece, row, col)
    pieces = {
      'k' => blacks.king,
      'q' => blacks.queen,
      'r1' => blacks.rook1,
      'r2' => blacks.rook2,
      'b1' => blacks.bishop1,
      'b2' => blacks.bishop2,
      'kn1' => blacks.knight1,
      'kn2' => blacks.knight2,
      'p1' => blacks.pawn1,
      'p2' => blacks.pawn2,
      'p3' => blacks.pawn3,
      'p4' => blacks.pawn4,
      'p5' => blacks.pawn5,
      'p6' => blacks.pawn6,
      'p7' => blacks.pawn7,
      'p8' => blacks.pawn8
    }

    piece_obj = pieces[piece]
    if piece_obj.nil?
      puts 'Invalid move'
      board.layout
      false
    elsif piece_obj.moveable?(board, row, col) == false
      board.layout
      false
    else
      piece_obj.move_piece(board, row, col)
      @moved = false
      true
    end
  end

  def turn
    until whites.king.position == [nil, nil] || blacks.king.position == [nil, nil]
      case @moved
      when false
        puts "make a move #{player1.name}"
        loop do
          storage = []
          puts 'choose piece'
          storage << gets.chomp
          puts 'choose row'
          storage << gets.chomp.to_i
          puts 'choose column'
          storage << gets.chomp.to_i
          if white_player_move(storage.shift, storage.shift, storage.shift)
            board.layout
            break
          else
            puts 'Invalid move. Please try again.'
          end
        end
      when true
        puts "make a move #{player2.name}"
        loop do
          storage = []
          puts 'choose piece'
          storage << gets.chomp
          puts 'choose row'
          storage << gets.chomp.to_i
          puts 'choose column'
          storage << gets.chomp.to_i
          if black_player_move(storage.shift, storage.shift, storage.shift)
            board.layout
            break
          else
            puts 'Invalid move. Please try again.'
          end
        end
      end
    end
  end
end
