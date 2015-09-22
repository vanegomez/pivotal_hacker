require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { Board.create(title: "My Board") }

  it 'is valid' do
    expect(board).to be_valid
  end

  it 'is invalid without a title' do
    board.title = nil
    expect(board).to_not be_valid
  end
end


