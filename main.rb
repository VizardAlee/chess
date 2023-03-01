# frozen_string_literal: false

require_relative 'lib/game'

game = Game.new
game.create_player
game.black_move('pawn1', [2, 0])
game.black_move('pawn1', [3, 0])
game.black_move('pawn1', [4, 0])
game.show
game.white_move('knight1', [5, 2])
game.white_move('knight1', [0, 4])
game.show
