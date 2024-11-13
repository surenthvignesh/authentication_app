class SessionsController < ApplicationController
	def destroy
		logout current_user
		redirect_to root_path, notice: "You have been logged out."
	end

	def new
	end

	def create
		binding.pry
		if user = User.authenticate_by(email: params[:email], password: params[:password])
			login user
			redirect_to root_path, notice: "You have signed successfully."
		else
			flash[:alert] = "Invalid email and password"
			render :new, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end

end