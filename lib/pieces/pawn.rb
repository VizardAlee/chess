# frozen_string_literal: false

require_relative 'pieces'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'

# pawn class
class Pawn < ChessPiece
  attr_accessor :new_piece, :change

  def moveable?(board, row, col)
    return false unless obstructed?(board, row, col) == false

    unless attackable?(board, row, col) == true
      if board.grid[row][col] == '-'
        puts "You can't move diagonally here bro"
      else
        puts "You can't take this piece bro"
      end
      return false
    end

    unless been_there?(row) == false
      puts "Can't go back sir"
      return false
    end

    unless board.in_bound?(row, col)
      puts 'Out of bounds!'
      return false
    end
    unless check_opposition(board, row, col) == true
      puts 'That is you comrade!'
      return false
    end
    true
  end

  def move_piece(board, row, col)
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    return one_or_two_steps(board, row, col) if first_move? == true # first steps
    # return attack(board, row, col) if attackable?(board, row, col) == true # for attack

    # return false unless board.grid[row][col] == '-' && delta_x == 1
    if board.grid[row][col] == '-' && delta_x == 1
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      true
    elsif attackable?(board, row, col) == true
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      true
    end

    return false unless opposite_end?(row) == true

    puts "Choose a character! 'q', 'r', 'b', 'kn'"
    transform(gets.chomp.downcase)
    @change = true
  end

  def attack(board, row, col)
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    if delta_x == 1 && delta_y == 1 && attackable?(board, row, col) == true
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
    end
    puts 'it is false'
    false
  end

  def first_move?
    in_row = @position.first
    return true if in_row == 1 && color == 'black' || in_row == 6 && color == 'white'
  end

  def one_or_two_steps(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs

    if first_move? == true && board.grid[row][col] == '-' && delta_x == 1 || delta_x == 2
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      return true
    elsif attackable?(board, row, col) == true
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      return true
    end
    false
  end

  def attackable?(board, row, col)
    return true if diagonal?(col) == false
    return true if top_right(board, row, col) == true
    return true if top_left(board, row, col) == true
    return true if bottom_right(board, row, col) == true
    return true if bottom_left(board, row, col) == true

    false
  end

  def top_right(board, row, col)
    in_row, in_col = position
    if in_row + 1 == row && in_col + 1 == col && board.grid[row][col] != color && board.grid[row][col] != '-'
      return true
    end

    false
  end

  def top_left(board, row, col)
    in_row, in_col = position
    if in_row + 1 == row && in_col - 1 == col && board.grid[row][col] != color && board.grid[row][col] != '-'
      return true
    end

    false
  end

  def bottom_right(board, row, col)
    in_row, in_col = position
    if in_row - 1 == row && in_col + 1 == col && board.grid[row][col] != color && board.grid[row][col] != '-'
      return true
    end

    false
  end

  def bottom_left(board, row, col)
    in_row, in_col = position
    if in_row - 1 == row && in_col - 1 == col && board.grid[row][col] != color && board.grid[row][col] != '-'
      return true
    end

    false
  end

  def diagonal?(col)
    in_col = @position.last

    delta_y = (in_col - col).abs
    return true if delta_y != 0

    false
  end

  def been_there?(row)
    visited.any? do |val|
      return true if val == row
    end

    false
  end

  def opposite_end?(row)
    if color == 'black' && row == 7 || color == 'white' && row.zero?
      @change = true
      return true
    end

    false
  end

  def transform(piece)
    @new_piece = piece
  end

  def to_s
    case @color
    when 'white'
      "\u{2659}"
    when 'black'
      "\u{265F}"
    else
      puts "#{color} not valid"
    end
  end
end
