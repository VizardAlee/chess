# frozen_string_literal: false

# creating player
class Player
  attr_reader :name
  attr_accessor :color

  def initialize(name, color)
    @name = name
    @color = color
  end
end
