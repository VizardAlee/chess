# frozen_string_literal: false

require_relative 'lib/game'

game = Game.new
game.create_player
game.black_move('pawn1', [2, 0])
game.black_move('pawn1', [3, 0])
game.black_move('pawn1', [4, 0])
game.show
game.white_move('knight1', [5, 2])
game.white_move('knight1', [4, 0])
game.player2.pieces.pawn1.taken_out(game.board)
#game.black_move('pawn2', [2, 1])
game.black_move('pawn2', [3, 1])
game.white_move('pawn2', [4, 1])
p game.player2.pieces.pawn2.position
game.show
