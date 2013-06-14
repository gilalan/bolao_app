class LoginController < ApplicationController

	skip_before_filter :require_login, :require_admin

	def index
		return if redirect_if_logged
		respond_to do |format|
	      format.html #index.html.erb
	    end
	end

	def do_logout
		Rails.logger.info("Deslogando")
	    Rails.logger.info(current_user)
		@_current_user = session[:current_user_id] = nil
		Rails.logger.info(current_user)
    	redirect_to root_url
	end

	def do_login
		return if redirect_if_logged
		_do_login(User::authenticate(params[:user][:email], params[:user][:password]))
	end

	def _do_login user
		if !user.nil?
			_set_session user
			redirect_if_logged
		else
			flash[:error] = "Nome de usuario ou senha invalidos"
			render action: :index
		end
	end

	def _set_session user
		Rails.logger.info "usuario setado na sessao"
		session[:current_user_id] = user.id
		Rails.logger.info (session[:current_user_id])
	end

end
