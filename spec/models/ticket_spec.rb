require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.create(title: "Ticket") }

  it 'is valid' do
    expect(ticket).to be_valid
  end

  it 'is invalid without a title' do
    ticket.title = nil
    expect(ticket).to_not be_valid
  end

  it 'responds to board' do
    respond_to :boards
  end
end
