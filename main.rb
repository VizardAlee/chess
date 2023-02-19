# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/queen'
require_relative 'lib/pieces/bishop'
require_relative 'lib/pieces/rook'
require_relative 'lib/player'

board = Board.new
king = King.new('white')
king.update_position(0, 4)
queen = Queen.new('black')
queen.update_position(7, 5)
rook = Rook.new('white')
rook.update_position(0, 0)
bishop = Bishop.new('black')
bishop.update_position(7, 7)
king.move(board, 1, 4)
queen.move(board, 6, 5)
rook.move(board, 0, 5)
rook.move(board, 3, 5)
bishop.move(board, 2, 2)
bishop.move(board, 4, 0)
queen.move(board, 6, 0)
king.move(board, 0, 4)
board.layout
