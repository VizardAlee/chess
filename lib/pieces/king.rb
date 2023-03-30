# frozen_string_literal: false

require_relative 'pieces'

# king class
class King < ChessPiece
  def moveable?(board, row, col)
    super

    if position == [nil, nil]
      puts "#{self.class} has been eliminated!"
      return false
    end

    puts color
    puts self.class
    return false if board.grid[row][col] == color || board.grid[row][col] != '-'

    arr = [0, 1, 2, 3, 4, 5, 6, 7]
    if arr.none? { |val| val == row } || arr.none? { |val| val == col }
      puts 'Invalid row value'
      return false
    end

    in_row, in_col = position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs
    return false unless obstructed?(board, row, col) == false

    unless (delta_x == 1 && delta_y == 1) || (delta_x.zero? && delta_y == 1) || (delta_x == 1 && delta_y.zero?)
      if scout(board, row, col) == true
        true
      else
        puts 'Wrong move bro! Cannot Castle'
        return false
      end
      true
    end
    true
  end

  def move_piece(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    return castle_move(board, row, col) if scout(board, row, col) == true

    if (delta_x == 1 && delta_y == 1) || (delta_x.zero? && delta_y == 1) || (delta_x == 1 && delta_y.zero?)
      eliminate(board, row, col)
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      @cannot_castle = true
    else
      puts 'Invalid move'
      false
    end
  end

  def scout(board, row, col)
    if short_castling(board, row, col) == true
      if board.grid[row][col + 1].cannot_castle == true
        puts 'Cannot castle'
        false
      else
        true
      end
    elsif long_castling(board, row, col) == true
      if board.grid[row][col - 2].cannot_castle == true
        puts 'Cannot castle'
        false
      else
        true
      end
    end
  end
=begin
  def castling(board, row, col)
    return false if cannot_castle == true

    case color
    when 'white'
      if obstructed?(board, row, col) == false && position == [7, 4] && (row == 7 && col == 6) || (row == 7 && col == 2)
        @castle = true
        @cannot_castle = true
        return true
      end
    when 'black'
      if obstructed?(board, row, col) == false && position == [0, 4] && (row == 0 && col == 6) || (row == 0 && col == 2)
        @castle = true
        @cannot_castle = true
        return true
      end
    end
    false
  end
=end
  def short_castling(board, row, col)
    case color
    when 'white'
      if obstructed?(board, row, col) == false && position == [7, 4] && (row == 7 && col == 6) && @cannot_castle == false
        @castle = true
        return true
      end
    when 'black'
      if obstructed?(board, row, col) == false && position == [0, 4] && (row.zero? && col == 6) && @cannot_castle == false
        @castle = true
        return true
      end
    end
    false
  end

  def long_castling(board, row, col)
    case color
    when 'white'
      if obstructed?(board, row, col) == false && position == [7, 4] && (row == 7 && col == 2) && @cannot_castle == false
        @castle = true
        return true
      end
    when 'black'
      if obstructed?(board, row, col) == false && position == [0, 4] && (row.zero? && col == 2) && @cannot_castle == false
        @castle = true
        return true
      end
    end
    false
  end

  def castle_move(board, row, col)
    in_row, in_col = @position
    delta_y = (in_col - col).abs

    if board.grid[row][col] == '-' && delta_y == 2
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      @cannot_castle = true
    else
      puts 'Invalid move...'
      false
    end
  end

  def to_s
    case @color
    when 'white'
      "\u{2654}"
    when 'black'
      "\u{265A}"
    else
      raise "Invalid color: #{@color}"
    end
  end
end
