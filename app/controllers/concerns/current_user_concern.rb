module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
			super || guest_user
	end

	def guest_user
		guest = GuestUser.new
		guest.name = "Guest User"
		guest.firstname = "Guest"
		guest.lastname = "User"
		guest.email = "guest@example.com"
		guest
	end
end