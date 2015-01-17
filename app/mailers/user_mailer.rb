class UserMailer < ApplicationMailer

	def tracking_mail(email)
		@email = email
		mail(to: @email.recipient, subject: 'tryout')
	end
end
