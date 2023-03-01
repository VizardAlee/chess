# frozen_string_literal: false

require_relative 'board_pieces'

# create player
class Player
  attr_reader :name
  attr_accessor :pieces

  def initialize(name, color)
    @name = name
    @pieces = BoardPieces.new(color)
  end
end
