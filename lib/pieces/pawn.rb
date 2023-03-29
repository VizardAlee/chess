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
    super

    if position == [nil, nil]
      puts "#{self.class} has been eliminated!"
      return false
    end

    return false if board.grid[row][col] == color && board.grid[row][col] != '-'

    arr = [0, 1, 2, 3, 4, 5, 6, 7]
    if arr.none? { |val| val == row } || arr.none? { |val| val == col }
      puts 'Invalid row value'
      return false
    end

    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - row).abs

    if delta_x > 2
      puts 'not more than 2 steps champ!'
      return false
    end

    if row == in_row && col == in_col
      puts 'You cannot take yourself out bro!'
      return false
    end

    if first_move? == true
      puts 'first move'
      return true if first_move_condition(board, row, col) == true
      return false if attackable?(board, row, col) == false

      false
    end


    if en_passant_scout(board) == true
      return true
    else
      false
    end

    return false unless obstructed?(board, row, col) == false

    unless first_move? == true
      puts 'not first move'
      if move_conditions(board, row, col) == false
        puts 'Only one step bro'
        return false
      else
        true
      end
    end

=begin
    unless first_move? == false
      if first_move_condition(board, row, col) == false
        puts 'Not so fast bro!'
        return false
      else
        true
      end
    end

    unless first_move? == true
      if move_conditions(board, row, col) == false
        puts 'Only one step bro'
        return false
      else
        true
      end
    end
=end
    unless attackable?(board, row, col) == true
      puts en_passant_scout(board)
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

    true
  end

  def move_piece(board, row, col)
    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    return one_or_two_steps(board, row, col) if first_move? == true # first steps
    return en_passant_takeout(board, row, col) if en_passant_scout(board) == true # en passant things

    en_passant_scout(board)
    if board.grid[row][col] == '-' && move_conditions(board, row, col) == true
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      true
    elsif attackable?(board, row, col) == true && delta_x == 1 && delta_y == 1
      @visited << in_row
      pawn_attack(board, row, col)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      true
    else
      puts 'is it here?'
    end

    return false unless opposite_end?(row) == true

    puts "Choose a character! 'q', 'r', 'b', 'kn'"
    transform(gets.chomp.downcase)
    @change = true
  end

  def first_move_condition(board, row, col)
    in_row, in_col = @position
    delta_x = in_row - row
    delta_y = (in_col - col).abs
    return false if color == 'white' && delta_x != 1 && delta_y != 1
    return false if color == 'white' && delta_x != -1 && delta_y != 1
    return false if color == 'white' && delta_x > 2
    return false if color == 'black' && delta_x < -2
    return true if attackable?(board, row, col) == true

    if board.grid[row][col] == '-' && color == 'white' && delta_x == 1 || delta_x == 2 && delta_y.zero?
      if delta_x == 1 && delta_y == 1
        puts 'nah man...'
        return false
      else
        puts 'one'
        return true
      end
    end
    if board.grid[row][col] == '-' && color == 'black' && delta_x == -1 || delta_x == -2 && delta_y.zero?
      if delta_x == -1 && delta_y == 1
        puts 'nah man 2'
        return false
      else
        puts 'two'
        return true
      end
    end

    puts 'not that direction'
    false
  end

  def move_conditions(board, row, col)
    in_row = @position.first
    return false if color == 'white' && in_row - row > 1
    return false if color == 'black' && in_row - row < -1
    return true if board.grid[row][col] == '-' && color == 'white' && in_row - row == 1 && in_row - row > 2
    return true if board.grid[row][col] == '-' && color == 'black' && in_row - row == -1 && in_row - row < -2
    return true if attackable?(board, row, col) == true

    puts "Can't go back bro!"
    false
  end

  def beyond_one(row)
    in_row = @position.first
    delta_x = (in_row - row).abs
    return true if delta_x > 1
  end

  def first_move?
    in_row = @position.first
    return true if in_row == 1 && color == 'black' || in_row == 6 && color == 'white'
  end

  def one_or_two_steps(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs

    if first_move? == true && first_move_condition(board, row, col) == true
      @en_passant = true if delta_x == 2
      @visited << in_row - 1 if delta_x == 2
      @visited << in_row
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      @heist = false if @heist == true
      return true
    elsif attackable?(board, row, col) == true
      @visited << in_row
      pawn_attack(board, row, col)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      return true
    else
      puts 'attempt failed'
      return false
    end

    puts "didn't work"
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

  def en_passant_scout(board)
    in_row, in_col = @position

    return false if (color == 'white' && in_row != 3) || (color == 'black' && in_row != 4)

    if board.grid[in_row][in_col + 1] != '-'
      board.grid[in_row][in_col + 1].en_passant
      return true
    elsif board.grid[in_row][in_col - 1] != '-'
      board.grid[in_row][in_col + 1].en_passant
      return true
    elsif board.grid[in_row][in_col - 1] == '-' || board.grid[in_row][in_col] == '-'
      false
    end
    false
  end

  def en_passant_takeout(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs
    return false unless en_passant_scout(board) == true

    if board.grid[in_row][col].en_passant == true && (delta_x == 1 && delta_y == 1)
      board.grid[in_row][col].update_position(nil, nil)
      board.grid[in_row][col].en_passant = false
      board.grid[in_row][col].position
      board.grid[in_row][in_col] = '-'
      board.grid[in_row][col] = '-'
      move(board, row, col)
      puts 'Pulled off the heist!'
      @heist = true
      true
    elsif board.grid[in_row][col].en_passant == true && move_conditions(board, row, col) == true
      true
    else
      puts 'Something is off'
      false
    end
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
