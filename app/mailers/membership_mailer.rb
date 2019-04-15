class MembershipMailer < ApplicationMailer
	default from: 'hello@5roots.co'
	default sender: '5roots'
	default bcc: 'sergio@5roots.co'

	def subscribe_membership(user)
		@user = user
		mail to: 'pepe@5roots.co', subject: "Nueva membresía del estudiante #{user.name}"



	end

	def destroy_membership(user)
		@user = user
		mail to: 'pepe@5roots.co', subject: "Cancelación de membresía del estudiante #{user.name}"
	end

end