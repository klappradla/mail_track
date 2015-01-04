class EmailsController < ApplicationController

	def index
		
	end

	def new
		@email = Email.new
	end

	def create
		@email = Email.new(email_params)
		if @email.save
			redirect_to root_path, notice: 'Email sent'
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
