class UserMailer < ApplicationMailer

	def tracking_mail
		mail(to: 'maxmulatz@gmail.com', subject: 'tryout').deliver
	end
end
