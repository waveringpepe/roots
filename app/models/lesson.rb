class Lesson < ApplicationRecord
	has_many :users
	has_many :students, :class_name => 'User'
end
