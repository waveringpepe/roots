class ExpertProfile < ApplicationRecord
	belongs_to :user, -> { where roles: "teacher" }

end
