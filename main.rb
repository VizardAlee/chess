# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/bishop'
require_relative 'lib/pieces/queen'

board = Board.new
king = King.new('white')
queen = Queen.new('white')
bqueen = Queen.new('black')
bishop = Bishop.new('white')
king.move(board, 4, 5)
king.move_piece(board, 5, 5)
queen.move(board, 0, 0)
queen.move_piece(board, 4, 4)
bqueen.move(board, 0, 5)
bqueen.move_piece(board, 5, 5)
bishop.move(board, 0, 6)
bishop.move_piece(board, 3, 3)
bishop.move_piece(board, 4, 4)
board.layout
