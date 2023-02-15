# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'
require_relative 'lib/pieces/queen'

b = Board.new
k = King.new('white', [0, 4])
q = Queen.new('black', [0, 3])
q.move(b, 7, 3)
k.move(b, -1, 4)
b.layout
p k.position
p q.position