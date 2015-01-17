class EmailsController < ApplicationController

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
			flash[:success] = 'email sent'
			UserMailer.tracking_mail(@email).deliver_later
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


	private

	# use strong parameters in rails 4
	def email_params
		params.require(:email).permit(:recipient)		
	end
end
