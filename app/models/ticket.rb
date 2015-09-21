class Ticket < ActiveRecord::Base
  belongs_to :board
  validates  :title, presence: true

  enum status: %w(backlog current_sprint in_progress done)

  def backlog
    where(status: 0)
  end

  def current_sprint
    where(status: 1)
  end

  def in_progress
    where(status: 2)
  end

  def done
    where(status: 3)
  end
end
