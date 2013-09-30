class UsersController < ApplicationController
	before_filter :require_login, except: [:new, :create]

	def new
	end

	def create
		if @user = User.create(user_params)
			flash[:success] = "Account created"
			session[:user_id] = @user.id
			redirect_to @user
		else
			flash[:error] = "Error, please try again."
			redirect_to signup_path
		end
	end

	def show
	end

	def update
	end

	private

	def user_params
		params.permit(:email, :password, :password_confirmation)
	end

end
