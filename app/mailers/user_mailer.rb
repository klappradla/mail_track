class UserMailer < ApplicationMailer
	helper LinksHelper

	def tracking_mail(email)
		@email = email
		mail(to: @email.recipient, subject: 'mail_track mail')
	end
end
