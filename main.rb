# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/queen'
require_relative 'lib/pieces/bishop'
require_relative 'lib/player'

board = Board.new
king = King.new('white')
king.update_position(0, 4)
queen = Queen.new('black')
queen.update_position(7, 5)
king.move(board, 1, 4)
queen.move(board, 6, 5)
board.layout