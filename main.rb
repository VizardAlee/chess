# frozen_string_literal: false

require_relative 'lib/game'

game = Game.new
game.create_player
game.white_move('pawn1', [5, 0])
game.black_move('pawn1', [2, 0])
game.show
game.white_move('knight1', [5, 2])
game.black_move('knight1', [2, 2])
game.show
