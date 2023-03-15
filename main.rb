# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/bishop'
require_relative 'lib/pieces/queen'
require_relative 'lib/pieces/knight'
require_relative 'lib/pieces/pawn'
require_relative 'lib/pieces/rook'

board = Board.new
king = King.new('white')
queen = Queen.new('white')
bqueen = Queen.new('black')
bishop = Bishop.new('white')
knight = Knight.new('black')
pawn = Pawn.new('white')
rook = Rook.new('black')
king.move(board, 4, 5)
king.move_piece(board, 5, 5)
queen.move(board, 0, 0)
queen.move_piece(board, 4, 4)
bqueen.move(board, 0, 5)
bqueen.move_piece(board, 5, 5)
bishop.move(board, 0, 6)
bishop.move_piece(board, 3, 3)
knight.move(board, 7, 6)
knight.move_piece(board, 6, 4)
pawn.move(board, 6, 6)
pawn.move_piece(board, 5, 5)
rook.move(board, 7, 3)
rook.move_piece(board, 3, 3)
queen.move_piece(board, 3, 3)
# bishop.move_piece(board, 4, 4)
board.layout
