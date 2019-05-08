class LessonMailer < ApplicationMailer
	default from: 'hello@5roots.co'
	default sender: '5roots'


	def teacher_email(user)
		@user = user
		@student_name = User.find_by(id: "#{Lesson.last.student_id}").name
		@lesson_date = Lesson.last.date_id.in_time_zone(User.find_by(id: "#{Lesson.last.user_id}").time_zone).to_formatted_s(:long_ordinal)
		@lesson_duration = Lesson.last.time_duration_id/60
		@lesson_language = Language.find_by(id: "#{Lesson.last.language_id}").name
		@teacher_timezone = User.find_by(id: "#{Lesson.last.user_id}").time_zone

		mail to: user.email, subject: "Clase de #{Language.find_by(id: "#{Lesson.last.language_id}").name} con #{User.find_by(id: "#{Lesson.last.student_id}").name}"

	end

	def student_email(user)
		@user = user
		@teacher_name = User.find_by(id: "#{Lesson.last.user_id}").name
		@lesson_date = Lesson.last.date_id.in_time_zone(User.find_by(id: "#{Lesson.last.student_id}").time_zone).to_formatted_s(:long_ordinal)
		@lesson_duration = Lesson.last.time_duration_id/60
		@lesson_language = Language.find_by(id: "#{Lesson.last.language_id}").name
		@student_timezone = User.find_by(id: "#{Lesson.last.student_id}").time_zone
		

		mail to: User.find_by(id: "#{Lesson.last.student_id}").email, subject: "Clase de #{Language.find_by(id: "#{Lesson.last.language_id}").name} con #{User.find_by(id: "#{Lesson.last.user_id}").name}"

	end


end