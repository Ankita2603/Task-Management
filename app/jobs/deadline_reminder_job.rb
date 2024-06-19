class DeadlineReminderJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find(task_id)
    TaskMailer.deadline_reminder(task).deliver_now
  end
end
