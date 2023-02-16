# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/pieces/king'

describe King do
  describe '#move' do
    let(:board) { Board.new }
    let(:king) { King.new(:white) }

    it 'allows the king to move one square in any direction' do
      king.update_position(1, 1)
      board.grid[1][1] = king
      expect(king.move(board, 0, 0)).to be_truthy
      expect(king.move(board, 1, 0)).to be_truthy
      expect(board.grid[1][0]).to eq(king)
      expect(king.position).to eq([1, 0])
    end
  end
end
