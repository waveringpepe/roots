class LessonMailer < ApplicationMailer
	default from: 'hello@5roots.co'
	default sender: '5roots'


	def teacher_email(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@student_name = User.find_by(id: "#{@lesson.student_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)
		@lesson_duration = @lesson.time_duration_id/60
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@student_email = User.find_by(id: "#{@lesson.student_id}").email


		mail to: @teacher_email , subject: "#{t('mailer_subject_1')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@student_name}"

	end

	def student_email(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@student_name = User.find_by(id: "#{@lesson.student_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)
		@lesson_duration = @lesson.time_duration_id/60
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		

		mail to: @student_email, subject: "#{t('mailer_subject_1')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@teacher_name}"

	end

	def cancel_lesson_student(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name
		@student_name = User.find_by(id: "#{@lesson.student_id}").name
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)

		mail to: @teacher_email, subject: "#{User.find_by(id: "#{@lesson.student_id}").name} #{t('mailer_subject_2')} #{Language.find_by(id: "#{@lesson.language_id}").name}"

	end

	def cancel_lesson_teacher(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name
		@student_name = User.find_by(id: "#{@lesson.student_id}").name
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)

		mail to: @student_email, subject: "#{User.find_by(id: "#{@lesson.user_id}").name} #{t('mailer_subject_2')} #{Language.find_by(id: "#{@lesson.language_id}").name}"

	end


end




	