class TaskMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def deadline_reminder(task)
		@task = task
		@user = task.user
		mail(to: @user.email, subject: 'Task Deadline Reminder')
	end
end
