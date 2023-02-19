# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/pieces'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/rook'

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

describe Queen do
  describe '#move' do
    let(:board) { Board.new }
    let(:queen) { Queen.new(:white) }

    it 'allows the queen to move any square in any direction' do
      queen.update_position(0, 4)
      board.grid[0][4] = queen
      expect(queen.move(board, 0, 0)).to be_truthy
      expect(queen.move(board, 7, 7)).to be_truthy
      expect(board.grid[7][7]).to eq(queen)
      expect(queen.position).to eq([7, 7])
    end
  end
end

describe Rook do
  describe '#move' do
    let(:board) { Board.new }
    let(:rook) { Queen.new(:white) }

    it 'allows the queen to move any square in any direction' do
      rook.update_position(0, 4)
      board.grid[0][4] = rook
      expect(rook.move(board, 0, 0)).to be_truthy
      expect(rook.move(board, 7, 0)).to be_truthy
      expect(board.grid[7][0]).to eq(rook)
      expect(rook.position).to eq([7, 0])
    end
  end
end
