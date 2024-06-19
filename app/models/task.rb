class Task < ApplicationRecord
  belongs_to :user

  enum state: { backlog: 'Backlog', in_progress: 'In-Progress', done: 'Done' }

  validates :title, :state, :deadline, presence: true
  validates :state, inclusion: { in: states.keys }

  scope :due_soon, -> { where(deadline: 1.day.from_now..1.hour.from_now).where.not(state: :done) }
end
