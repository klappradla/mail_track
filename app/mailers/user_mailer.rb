class UserMailer < ApplicationMailer

	def tracking_mail(recipient)
		mail(to: recipient, subject: 'tryout')
	end
end
