# frozen_string_literal: false

require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#out_of_bounds?' do
    context 'when the move is out of bounds' do
      it 'returns true' do
        expect(board.out_of_bounds?([-1, 0])).to eq(true)
        expect(board.out_of_bounds?([0, 0])).to eq(false)
        expect(board.out_of_bounds?([0, 9])).to eq(true)
        expect(board.out_of_bounds?([9, 0])).to eq(true)
      end
    end
  end
end
