# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/pieces'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/knight'

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

    it 'allows the Rook to move any square Veritcally or horizontally' do
      rook.update_position(0, 4)
      board.grid[0][4] = rook
      expect(rook.move(board, 0, 0)).to be_truthy
      expect(rook.move(board, 7, 0)).to be_truthy
      expect(board.grid[7][0]).to eq(rook)
      expect(rook.position).to eq([7, 0])
    end
  end
end

describe Knight do
  describe '#move' do
    let(:board) { Board.new }
    let(:knight) { Knight.new(:white) }

    it 'allows the Knight to move any square in an L direction' do
      knight.update_position(0, 1)
      board.grid[0][1] = knight
      expect(knight.move(board, 2, 0)).to be_truthy
      expect(knight.move(board, 3, 2)).to be_truthy
      expect(board.grid[3][2]).to eq(knight)
      expect(knight.position).to eq([3, 2])
    end
  end
end
