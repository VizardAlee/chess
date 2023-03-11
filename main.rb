# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/bishop'
require_relative 'lib/pieces/queen'

board = Board.new
king = King.new('white')
queen = Queen.new('white')
queen.move(board, 0, 0)
queen.move_piece(board, 7, 7)
king.move(board, 4, 5)
king.move_piece(board, 5, 5)
board.layout
