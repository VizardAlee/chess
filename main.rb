# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/bishop'

board = Board.new
king = King.new('white')
# bishop = Bishop.new('white')
# bishop.move(board, 5, 5)
king.move(board, 4, 5)
king.move_piece(board, 5, 5)
board.layout
