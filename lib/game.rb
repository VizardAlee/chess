# frozen_string_literal: false

require_relative 'board'
require_relative 'player'

# Game class
class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
  end

  def create_player
    puts 'Pick a Name'
    player1_name = gets.chomp
    puts 'Choose your color, white or black?'
    player1_color = gets.chomp.downcase

    valid_colors = %w[white black]

    unless valid_colors.include?(player1_color)
      puts "#{player1_color} is not valid! Please choose a valid color"
      return false
    end

    case player1_color
    when 'white'
      puts "#{player1_name} is player 1"
      puts 'Please what is your name, player 2?'
      player2_color = 'black'
      player2_name = gets.chomp
      @player1 = Player.new(player1_name, player1_color)
      @player2 = Player.new(player2_name, player2_color)
    when 'black'
      puts "#{player1_name} is player 2"
      puts 'Please what is your name, player 1?'
      player2_color = 'white'
      player2_name = gets.chomp
      @player1 = Player.new(player2_name, player2_color)
      @player2 = Player.new(player1_name, player1_color)
    end
    board_setup_black
    board_setup_white
    declaration
  end

  def declaration
    puts 'Player with the white army strikes first!'
    puts "#{player1.name} VS #{player2.name}! Let's Goo!!"
    show
  end

  def board_setup_white
    board.grid[7][0] = player1.rook1
    player1.rook1.update_position(7, 0)
    board.grid[7][1] = player1.knight1
    player1.knight1.update_position(7, 1)
    board.grid[7][2] = player1.bishop1
    player1.bishop1.update_position(7, 2)
    board.grid[7][3] = player1.queen
    player1.queen.update_position(7, 3)
    board.grid[7][4] = player1.king
    player1.king.update_position(7, 4)
    board.grid[7][5] = player1.bishop2
    player1.bishop2.update_position(7, 5)
    board.grid[7][6] = player1.knight2
    player1.knight2.update_position(7, 6)
    board.grid[7][7] = player1.rook2
    player1.rook2.update_position(6, 7)
    board.grid[6][0] = player1.pawn1
    player1.pawn1.update_position(6, 0)
    board.grid[6][1] = player1.pawn2
    player1.pawn2.update_position(6, 1)
    board.grid[6][2] = player1.pawn3
    player1.pawn3.update_position(6, 2)
    board.grid[6][3] = player1.pawn4
    player1.pawn4.update_position(6, 3)
    board.grid[6][4] = player1.pawn5
    player1.pawn5.update_position(6, 4)
    board.grid[6][5] = player1.pawn6
    player1.pawn6.update_position(6, 5)
    board.grid[6][6] = player1.pawn7
    player1.pawn7.update_position(6, 6)
    board.grid[6][7] = player1.pawn8
    player1.pawn8.update_position(6, 7)
  end

  def board_setup_black
    board.grid[0][0] = player2.rook1
    player2.rook1.update_position(0, 0)
    board.grid[0][1] = player2.knight1
    player2.knight1.update_position(0, 1)
    board.grid[0][2] = player2.bishop1
    player2.bishop1.update_position(0, 2)
    board.grid[0][3] = player2.queen
    player2.queen.update_position(0, 3)
    board.grid[0][4] = player2.king
    player2.king.update_position(0, 4)
    board.grid[0][5] = player2.bishop2
    player2.bishop2.update_position(0, 5)
    board.grid[0][6] = player2.knight2
    player2.knight2.update_position(0, 6)
    board.grid[0][7] = player2.rook2
    player2.rook2.update_position(0, 7)
    board.grid[1][0] = player2.pawn1
    player2.pawn1.update_position(1, 0)
    board.grid[1][1] = player2.pawn2
    player2.pawn2.update_position(1, 1)
    board.grid[1][2] = player2.pawn3
    player2.pawn3.update_position(1, 2)
    board.grid[1][3] = player2.pawn4
    player2.pawn4.update_position(1, 3)
    board.grid[1][4] = player2.pawn5
    player2.pawn5.update_position(1, 4)
    board.grid[1][5] = player2.pawn6
    player2.pawn6.update_position(1, 5)
    board.grid[1][6] = player2.pawn7
    player2.pawn7.update_position(1, 6)
    board.grid[1][7] = player2.pawn8
    player2.pawn8.update_position(1, 7)
  end

  def white_move(piece, spot)
    row = spot.first
    col = spot.last
    case piece.to_sym
    when :king
      player1.king.move(@board, row, col)
    when :queen
      player1.queen.move(@board, row, col)
    when :rook1
      player1.rook1.move(@board, row, col)
    when :rook2
      player1.rook2.move(@board, row, col)
    when :bishop1
      player1.bishop1.move(@board, row, col)
    when :bishop2
      player1.bishop2.move(@board, row, col)
    when :knight1
      player1.knight1.move(@board, row, col)
    when :knight2
      player1.knight2.move(@board, row, col)
    when :pawn1
      player1.pawn1.move(@board, row, col)
    when :pawn2
      player1.pawn2.move(@board, row, col)
    when :pawn3
      player1.pawn3.move(@board, row, col)
    when :pawn4
      player1.pawn4.move(@board, row, col)
    when :pawn5
      player1.pawn5.move(@board, row, col)
    when :pawn6
      player1.pawn6.move(@board, row, col)
    when :pawn7
      player1.pawn7.move(@board, row, col)
    when :pawn8
      player1.pawn8.move(@board, row, col)
    else
      puts "#{piece} is not a valid charcter"
      false
    end
  end

  def black_move(piece, spot)
    row = spot.first
    col = spot.last
    case piece.to_sym
    when :king
      player2.king.move(@board, row, col)
    when :queen
      player2.queen.move(@board, row, col)
    when :rook1
      player2.rook1.move(@board, row, col)
    when :rook2
      player2.rook2.move(@board, row, col)
    when :bishop1
      player2.bishop1.move(@board, row, col)
    when :bishop2
      player2.bishop2.move(@board, row, col)
    when :knight1
      player2.knight1.move(@board, row, col)
    when :knight2
      player2.knight2.move(@board, row, col)
    when :pawn1
      player2.pawn1.move(@board, row, col)
    when :pawn2
      player2.pawn2.move(@board, row, col)
    when :pawn3
      player2.pawn3.move(@board, row, col)
    when :pawn4
      player2.pawn4.move(@board, row, col)
    when :pawn5
      player2.pawn5.move(@board, row, col)
    when :pawn6
      player2.pawn6.move(@board, row, col)
    when :pawn7
      player2.pawn7.move(@board, row, col)
    when :pawn8
      player2.pawn8.move(@board, row, col)
    else
      puts "#{piece} is not a valid charcter"
      false
    end
  end

  def show
    board.layout
  end
end
