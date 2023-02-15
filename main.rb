# frozen_string_literal: false

require_relative 'lib/board'
require_relative 'lib/pieces/king'

b = Board.new
k = King.new('white', [7, 4])
k.move(b, 4, 4)
b.layout
# p b.grid
p k.position