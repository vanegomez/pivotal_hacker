require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:board) { Board.create(title: "Title") }
  let(:ticket) { Ticket.create(title: "Title", description: "Description", board_id: 1) }

  context '#index' do
    it 'returns all the boards'do
      board

      get :index
      expect(response).to have_http_status(:success)
      expect(Board.count).to eq(1)
    end
  end

  context '#show' do
    it 'a board' do
      ticket
      get :show, id: board.id

      expect(response).to have_http_status(:success)
      expect(Ticket.count).to eq(1)
    end
  end

  context '#create' do
    it 'creates a board' do
      board
      expect(Board.count).to eq(1)

      post :create, board: { title: 'My Board' }
      expect(Board.count).to eq(2)
      expect(response).to have_http_status(:found)
    end
  end

  context '#update' do
    it 'updates a poptart' do
      board

      put :update, id: board.id, board: { title: "Vane" }

      expect(response).to have_http_status(:found)
      expect(board.reload.title).to eq('Vane')
    end
  end

  context '#destroy' do
    it 'destroys a board' do
      board

      expect {
        delete :destroy, id: board.id
      }.to change { Board.count }.from(1).to(0)
    end
  end
end
