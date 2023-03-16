# frozen_string_literal: false

require_relative 'board'
require_relative 'player'
require_relative 'prep'

# bringing things together
class Game
  attr_accessor :board, :p1, :p2, :player1, :player2, :whites, :blacks, :groups

  def initialize
    @board = Board.new
    @p1 = []
    @p2 = []
    player_start
    assemble
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
end
