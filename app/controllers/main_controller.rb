class MainController < ApplicationController
  
  skip_before_filter :require_login, :require_admin
  
  def index
  	respond_to do |format|
      format.html #index.html.erb
    end
  end

  def regras
  	respond_to do |format|
      format.html #regras.html.erb
    end
  end

  def cadastro
  	redirect_to controller: :users, action: :new
  end

  def ranking

    @users = User.all(:order => 'score DESC')

  	respond_to do |format|
      format.html #ranking.html.erb
    end
  end

  def current_logged_user
    Rails.logger.info("Passando pelo current_logged_user")
    if logged_in?
      @user = current_user
    else
      @user = nil
    end
    Rails.logger.info("*************************")
    Rails.logger.info(@user)
  end

end
