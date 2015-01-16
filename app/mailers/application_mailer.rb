class ApplicationMailer < ActionMailer::Base
	#include Roadie::Rails::Automatic

  default css: 'mailer', from: "from@example.com"
  layout 'mailer'
end
