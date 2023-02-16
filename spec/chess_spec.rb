# frozen_string_literal: false

require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#in_bound?' do
    context 'when the move is out of bounds' do
      it 'returns false' do
        expect(board.in_bound?(-1, 0)).to eq(false)
        expect(board.in_bound?(1, 7)).to eq(true)
        expect(board.in_bound?(0, 8)).to eq(false)
      end
    end
  end
end
