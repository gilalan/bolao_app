class UsersController < ApplicationController
  
  skip_before_filter :require_login
  skip_before_filter :require_admin, :only => [:new, :create, :edit, :update]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    #return if redirect_if_logged
    if logged_in?
      flash[:notice] = "#{current_user.name} #{current_user.lastname}, voce ja esta logado, efetue o logout antes de realizar um novo cadastro."
    end
    @user = User.new
    
    respond_to do |format|
      format.html      
    end
  end

  # GET /users/1/edit
  def edit
    
    @user = User.find(params[:id])
    Rails.logger.info("****************** Pass Confirmation? ************************")
    @user.email_confirmation = params[:email_confirmation] unless params[:email_confirmation].nil?
    
    respond_to do |format|
      format.html # index.html.erb
    end

  end

  # POST /users
  # POST /users.json
  def create
    
    if logged_in?
      #flash[:notice] = "#{current_user.name} #{current_user.lastname}, voce ja esta logado, efetue o logout antes de realizar um novo cadastro"
      @user = User.new
      return render action: :new
    end

    @user = User.new(:name => params[:user][:name], :lastname => params[:user][:lastname], :email => params[:user][:email].downcase, :password => params[:user][:password], :typeof => 2, :score => 0)

    Rails.logger.info(@user.to_yaml)

    respond_to do |format|
           
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.email_confirmation = params[:user][:email_confirmation].downcase

      if @user.save
        flash[:notice] = 'Voce foi cadastrado com sucesso e ja pode elaborar seus palpites.'
        format.html { redirect_to controller: :login, action: :do_login, user: {:email => @user.email, :password => @user.password}}
      else
        format.html { render action: "new" }
      end

    end

  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    
    @user = User.find(params[:id])

    respond_to do |format|

      @user.email_confirmation = params[:user][:email_confirmation].downcase

      if @user.update_attributes(:name => params[:user][:name], :lastname => params[:user][:lastname], :email => params[:user][:email].downcase)
        
        flash[:notice] = "Dados atualizados com sucesso!!"
        format.html { redirect_to :controller => :users, :action => :edit, :id =>  @user.id}

      else
                
        format.html { render action: "edit", :id => @user.id, :email_confirmation => @user.email_confirmation}

      end

    end

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
