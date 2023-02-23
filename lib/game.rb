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

    declaration
  end

  def declaration
    puts 'Player with the white army strikes first!'
    puts "#{player1.name} VS #{player2.name}! Let's Goo!!"
  end
end
