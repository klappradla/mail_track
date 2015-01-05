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
			redirect_to root_path
		else
			render :new
		end
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
