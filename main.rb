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
p game.player2.pieces.pawn1.position
game.black_move('pawn1', [5, 0])
p game.player2.pieces.pawn1.position
game.show
