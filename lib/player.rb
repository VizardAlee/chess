# frozen_string_literal: false

# creating player
class Player
  attr_reader :name
  attr_accessor :color, :k, :q, :r1, :r2, :b1, :b2, :kn1, :kn2, :p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8

  def initialize(name, color)
    @name = name
    @color = color
  end
end
