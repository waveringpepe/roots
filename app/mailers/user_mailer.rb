class UserMailer < ApplicationMailer
	default from: 'hello@5roots.co'

	def match_email
		@teacher = User.find_by(id: "#{Match.last.user_id}")
		@student = User.find_by(id: "#{Match.last.student_id}")
		@language = Language.find_by(id: "#{Match.last.language_id}")


		mail to: User.find_by(id: "#{Match.last.student_id}").email , subject: "¡#{User.find_by(id: "#{Match.last.student_id}").name} te hemos asignado a un profesor!" , field_name: '5roots'
	end
end