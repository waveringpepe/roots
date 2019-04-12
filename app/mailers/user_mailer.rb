class UserMailer < ApplicationMailer
	default from: 'hello@5roots.co'

	def match_email
		@teacher = User.find_by(id: "#{Match.last.user_id}")
		@student = User.find_by(id: "#{Match.last.student_id}")

		mail to: User.find_by(id: "#{Match.last.student_id}").email , subject: "¡#{User.find_by(id: "#{Match.last.student_id}").name} te hemos asignado a un profesor!"
	end
end