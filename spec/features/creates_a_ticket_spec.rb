require "rails_helper"

RSpec.feature "a ticket" do
  it "can be created" do
    board = Board.create(title: "New Board")
    visit board_path(board)
    fill_in "ticket[title]", with: "Ticket"
    fill_in "ticket[description]", with: "Description"
    click_link_or_button("Create Ticket")
    expect(page).to have_content("Ticket")
  end
end
