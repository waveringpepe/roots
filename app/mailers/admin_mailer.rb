class AdminMailer < ApplicationMailer
	default from: 'hello@5roots.co'
	default sender: '5roots'
	default bcc: 'sergio@5roots.co'


	def student_signup
		@student = User.last
		mail to: 'pepe@5roots.co', subject: "Nuevo registro del estudiante #{User.last.name}"
	end

	def teacher_signup
		@teacher = User.last
		mail to: 'pepe@5roots.co', subject: "Nuevo registro del profesor  #{User.last.name}"
	end
end