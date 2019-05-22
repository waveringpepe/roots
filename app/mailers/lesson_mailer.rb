class LessonMailer < ApplicationMailer
	default from: 'hello@5roots.co'
	default sender: '5roots'


	def teacher_email(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)
		@lesson_duration = @lesson.time_duration_id/60
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@student_email = User.find_by(id: "#{@lesson.student_id}").email


		mail to: @teacher_email , subject: "#{t('mail_lessons_lesson_of')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@student_name}"

	end

	def student_email(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)
		@lesson_duration = @lesson.time_duration_id/60
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		

		mail to: @student_email, subject: "#{t('mail_lessons_lesson_of')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@teacher_name}"

	end

	def cancel_lesson_student(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)

		mail to: @teacher_email, subject: "#{@student_name} #{t('mailer_subject_2')} #{@lesson_language}"

	end

	def cancel_lesson_teacher(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)

		mail to: @student_email, subject: "#{@teacher_name} #{t('mailer_subject_2')} #{@lesson_language}"

	end

	def reminder_lesson_student_1(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)

		mail to: @student_email, subject: "#{@student_name} #{t('mailer_lessons_reminder_1')} #{t('mailer_subject_1')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@teacher_name}"

	end

	def reminder_lesson_teacher_1(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@teacher_timezone).to_formatted_s(:long_ordinal)

		mail to: @teacher_email, subject: "#{@teacher_name} #{t('mailer_lessons_reminder_1')} #{t('mailer_subject_1')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@student_name}"

	end

	def reminder_lesson_student_2(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)

		mail to: @student_email, subject: "#{@student_name} #{t('mailer_lessons_reminder_2')} #{t('mailer_subject_1')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@teacher_name}"

	end

	def reminder_lesson_teacher_2(lesson)
		@lesson = lesson
		@teacher_name = User.find_by(id: "#{@lesson.user_id}").name.capitalize
		@teacher_email = User.find_by(id: "#{@lesson.user_id}").email
		@teacher_timezone = User.find_by(id: "#{@lesson.user_id}").time_zone
		@student_name = User.find_by(id: "#{@lesson.student_id}").name.capitalize
		@student_email = User.find_by(id: "#{@lesson.student_id}").email
		@lesson_language = Language.find_by(id: "#{@lesson.language_id}").name
		@student_timezone = User.find_by(id: "#{@lesson.student_id}").time_zone
		@lesson_date = @lesson.date_id.in_time_zone(@student_timezone).to_formatted_s(:long_ordinal)

		mail to: @teacher_email, subject: "#{@teacher_name} #{t('mailer_lessons_reminder_2')} #{t('mailer_subject_1')} #{@lesson_language} #{t('mailer_subject_1_a')} #{@student_name}"

	end

end




	