# frozen_string_literal: false

# piece class
class ChessPiece
  attr_accessor :position, :visited
  attr_reader :color

  def initialize(color, row = nil, col = nil)
    @color = color
    @position = [row, col]
    @visited = []
  end

  def moveable?(board, row, col)
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

  def move(board, row, col)
    board.grid[row][col] = self
    update_position(row, col)
  end

  def pawn_attack(board, row, col)
    in_row, in_col = @position
    delta_y = (in_col - col).abs

    if delta_y == 1 && board.grid[row][col] != color || board.grid[row][col] != '-'
      move(board, row, col)
      board.grid[in_row][in_col] = '-'
      return true
    end
    false
  end

  def check_opposition(board, row, col)
    board.grid[row][col] == '-' || board.grid[row][col].color != color ? true : false
  end

  def update_position(row, col)
    @position = [row, col]
  end

  private

  def obstructed?(board, row, col)
    in_row, in_col = @position
    delta_x = (in_row - row).abs
    delta_y = (in_col - col).abs

    dir_x = delta_x.positive? ? (row - in_row) / delta_x : 0
    dir_y = delta_y.positive? ? (col - in_col) / delta_y : 0
    (1..[delta_x, delta_y].max - 1).each do |i|
      pos_x = in_row + i * dir_x
      pos_y = in_col + i * dir_y
      if board.grid[pos_x][pos_y] != '-'
        puts "Obstruction detected at [#{pos_x}, #{pos_y}]"
        return true
      end
    end
    false
  end

  def take_out(board, row, col)
    board.grid[row][col].position = [nil, nil] if board.grid[row][col] != '-' && board.grid[row][col].color != color
  end

  def not_on_board
    puts "#{color} #{self.class} (#{self}) is not playable"
  end
end
