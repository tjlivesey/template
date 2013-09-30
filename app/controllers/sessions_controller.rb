class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user and user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to redirect_uri
		else
			flash[:error] = "Invalid email or password, please try again."
			redirect_to login_path
		end
	end

	def destroy
	end

	private

	def redirect_uri
		redirect = (session.delete(:redirect_uri) or params[:redirect_uri])
		if redirect
			uri = URI.parse(redirect)
			return uri.path
		else
			return root_path
		end
	rescue URI::InvalidURIError
		return root_path
	end

end
