# frozen_string_literal: false

require_relative 'pieces'

# pawn class
class Pawn < ChessPiece
  def possible_moves
    # pawn moves one square farward
    # cannot reverse or move sideways
    # can only take opponnent pieces in diagonal positions one step ahead of it
    # first move can grant it two steps forward, if there are no obstructions

    moves = []
    case @color
    when 'white'
      moves = [[1, 0]]
      moves << [2, 0] if position[0] == 1
      moves << [1, -1] << [1, 1] if position[0] < 7
    when 'black'
      moves = [[-1, 0]]
      moves << [-2, 0] if position[0] == 6
      moves << [-1, -1] << [-1, 1] if position[0].positive?
    end
    moves
  end

  def move(board, row2, col2)
    if position == [nil, nil]
      puts "#{self} has been taken"
      return false
    end

    if board.in_bound?(row2, col2)
      row1, col1 = position
      delta_x = (row1 - row2).abs
      delta_y = (col1 - col2).abs

      if delta_x <= 2 && delta_y.zero?
        if delta_x == 2 && position[0] == 1 || delta_x == 2 && position[0] == 6
          if board.grid[row1 - 1][col1] == '-' && board.grid[row2][col2] == '-' # when it's the first move
            board.grid[row1][col1] = '-'
            board.grid[row2][col2] = self
            update_position(row2, col2)
            true
          else
            puts 'Invalid move'
            false
          end
        elsif delta_x == 1 # when it's not first move
          board.grid[row1][col1] = '-'
          board.grid[row2][col2] = self
          update_position(row2, col2)
          true
        else
          puts 'Invalid move'
          false
        end
      else
        puts 'Invalid move'
        false
      end
    else
      puts 'Out of bounds'
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
