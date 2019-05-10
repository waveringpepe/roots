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

	def cancel_lesson_student(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name
		@student_name = User.find_by(id: "#{@lesson.student_id}").name
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)

		mail to: @teacher_email, subject: "#{User.find_by(id: "#{@lesson.student_id}").name} canceló la clase de #{Language.find_by(id: "#{@lesson.language_id}").name}"

	end

	def cancel_lesson_teacher(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name
		@student_name = User.find_by(id: "#{@lesson.student_id}").name
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)

		mail to: @student_email, subject: "#{User.find_by(id: "#{@lesson.user_id}").name} canceló la clase de #{Language.find_by(id: "#{@lesson.language_id}").name}"

	end


end