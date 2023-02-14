# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/pieces/king'

describe Board do
  let(:board) { Board.new }
  let(:piece) { King.new('white', [7, 4])}

  describe '#out_of_bounds?' do
    context 'when the move is out of bounds' do
      it 'returns true' do
        expect(board.out_of_bounds?(-1, 0)).to eq(true)
        expect(board.out_of_bounds?(0, 0)).to eq(false)
        expect(board.out_of_bounds?(0, 9)).to eq(true)
        expect(board.out_of_bounds?(9, 0)).to eq(true)
      end
    end
  end

  describe '#place' do
    context 'when a piece is to be placed' do
      it 'places piece in the desired position' do
        board.place(piece, 0, 0)
        expect(board.grid[0][0]).to eq piece
      end
    end
  end

  describe '#traverse' do
    context 'when a move is initiated' do
      it 'moves piece from one spot to the other' do
        board.traverse(piece, [1, 0])
        expect(board.grid[6][4]).to eq piece
      end
    end
  end
end
