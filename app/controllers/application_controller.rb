class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login, :require_admin
  before_filter :current_logged_user

  def pre_action
  	current_user
  	logger.info 'current user, pre action'
  end

  def redirect_if_logged
      if !current_user.nil?
        user = current_user
        if user.typeof.to_i == User::USER_TYPE[:ADMIN][:id]
          #redirect_to root_path
          redirect_to controller: :admin, action: :index
          #redirecionar para pagina de administrador da app
        else 
          redirect_to controller: :hints, action: :index
          #redirecionar para pagina de palpites do usuario
        end
        true
      else 
        false
      end
  end

  def redirect_if_not_logged
      if current_user.nil?
        redirect_to controller: :login, action: :login
      end
  end

  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_user
  end

  def current_logged_user
    
  end

  private

  def require_login
    unless logged_in?
      flash[:notice] = "Voce precisa efetuar o login para acessar esta parte do site."
      redirect_to controller: :login, action: :index
    end
  end

  def require_admin
    unless logged_in? && is_admin?
      flash[:notice] = "Voce precisa efetuar o login de administrador para acessar esta parte do site."
      redirect_to controller: :login, action: :index
    end
  end

  def is_admin?
    Rails.logger.info("is admin teste")
    Rails.logger.info(current_user.typeof.to_i)
    current_user.typeof.to_i == User::USER_TYPE[:ADMIN][:id] ? true : false
  end

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

end
