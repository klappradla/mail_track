class EmailsController < ApplicationController
	TRACKING_IMAGE_PATH = File.join(Rails.root, "app", "assets", "images", "tracking.gif")

	def index
		@emails = Email.all
		new
	end

	def new
		@email = Email.new
	end

	def create
		@email = Email.new(email_params)
		if @email.save
			@email.add_links
			UserMailer.tracking_mail(@email).deliver_later
			flash[:success] = 'email sent'
		else
			flash[:danger] = @email.errors.full_messages.first
		end
		redirect_to root_path
	end

	def destroy
		@email = Email.find(params[:id])
		if @email.destroy
			flash[:success] = "email deleted"
		end
		redirect_to root_path
	end

	def image
		email = Email.find(params[:email_id])
		email.increment!(:opened, 1)
		send_file TRACKING_IMAGE_PATH
	end


	private

	# use strong parameters in rails 4
	def email_params
		params.require(:email).permit(:recipient)		
	end
end
