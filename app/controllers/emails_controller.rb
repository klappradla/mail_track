class EmailsController < ApplicationController

	def index
		@emails = Email.all
	end

	def new
		@email = Email.new
	end

	def create
		@email = Email.new(email_params)
		if @email.save
			flash[:success] = 'Email sent'
			redirect_to root_path
		else
			render :new
		end
	end


	private

	# use strong parameters in rails 4
	def email_params
		params.require(:email).permit(:recipient)		
	end
end
