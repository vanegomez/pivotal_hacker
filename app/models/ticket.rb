class Ticket < ActiveRecord::Base
  belongs_to :board
  enum status: %w(ordered paid completed cancelled)
end
