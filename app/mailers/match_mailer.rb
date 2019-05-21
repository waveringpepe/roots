class MatchMailer < ApplicationMailer
	default from: 'hello@5roots.co'
	default sender: '5roots'


	def teacher_email(match)

		@match = match
		@teacher = User.find_by(id: "#{@match.user_id}")
		@teacher_name = User.find_by(id: "#{@match.user_id}").name
		@teacher_email = User.find_by(id: "#{@match.user_id}").email
		@student = User.find_by(id: "#{@match.student_id}")
		@student_name = User.find_by(id: "#{@match.student_id}").name
		@student_email = User.find_by(id: "#{@match.student_id}").email
		@language = Language.find_by(id: "#{@match.language_id}")

		email_with_name = %("#{@teacher_name}" < #{@teacher_email} >)

		mail to: email_with_name, subject: "¡#{@teacher_name} #{t('match_mailer_subject_1')}"
	end

	def student_email(match)
		@match = match
		@teacher = User.find_by(id: "#{@match.user_id}")
		@teacher_name = User.find_by(id: "#{@match.user_id}").name
		@teacher_email = User.find_by(id: "#{@match.user_id}").email
		@student = User.find_by(id: "#{@match.student_id}")
		@student_name = User.find_by(id: "#{@match.student_id}").name
		@student_email = User.find_by(id: "#{@match.student_id}").email
		@language = Language.find_by(id: "#{@match.language_id}")

		email_with_name = %("#{@student_name}" <#{@student_email}>)


		mail to: email_with_name, subject: "¡#{@student_name} #{t('match_mailer_subject_1')}"
	end


end
