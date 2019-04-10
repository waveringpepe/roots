class Match < ApplicationRecord
  belongs_to :user
  belongs_to :student, :class_name => 'User'
  belongs_to :language
end
