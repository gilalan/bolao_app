class HintsController < ApplicationController
  
  skip_before_filter :require_admin, :except => :admin_all_hints

  # GET /hints
  # GET /hints.json
  def index
    
    if !current_user.nil?
      @user = current_user
    end

    Rails.logger.info(@user.to_yaml)

    @games = Game.all(:include => :match_results, :order => 'gamedate ASC, gametime ASC')

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /hints/1
  # GET /hints/1.json
  def show
    @hint = Hint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hint }
    end
  end

  # GET /hints/new
  # GET /hints/new.json
  def new
    @hint = Hint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hint }
    end
  end

  # GET /hints/1/edit
  def edit
    @hint = Hint.find(params[:id])
  end

  # POST /hints
  # POST /hints.json
  def create
    @hint = Hint.new(params[:hint])

    respond_to do |format|
      if @hint.save
        format.html { redirect_to @hint, notice: 'Hint was successfully created.' }
        format.json { render json: @hint, status: :created, location: @hint }
      else
        format.html { render action: "new" }
        format.json { render json: @hint.errors, status: :unprocessable_entity }
      end
    end
  end

  def create user_id, team_id, game_id, goals
   
    Hint.transaction do
      begin 
        @hint = Hint.new(:user_id => user_id, :team_id => team_id, :game_id => game_id, :goals => goals)
        
        if !@hint.save
          return false
        else
          return true
        end

      rescue => e
        logger.error e.message
        print e.to_s + "\n" + e.backtrace.join("\n")
      end
    end

  end

  # PUT /hints/1
  # PUT /hints/1.json
  def update
    @hint = Hint.find(params[:id])

    respond_to do |format|
      if @hint.update_attributes(params[:hint])
        format.html { redirect_to @hint, notice: 'Hint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hint.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def updateGoals hint, goals
    Hint.transaction do
      begin
        hint.update_attributes(:goals => goals)
      rescue => e
        logger.error e.message
        print e.to_s + "\n" + e.backtrace.join("\n")
      end
    end
  end

  # DELETE /hints/1
  # DELETE /hints/1.json
  def destroy
    @hint = Hint.find(params[:id])
    @hint.destroy

    respond_to do |format|
      format.html { redirect_to hints_url }
      format.json { head :no_content }
    end
  end

  def saveHint
    hints = params[:array_hints] if params[:array_hints].present?
    Rails.logger.info(hints.inspect)
    #Rails.logger.info(hints.class.name)
    savedAll = true

    #This is a HashWithIndifferentAccess array
    hints.each do |index, jhint|

      jhint.each do |key, value|
        if key.eql?("teamid")
          @team_id = value
        elsif key.eql?("gameid")
          @game_id = value
        elsif key.eql?("userid")
          @user_id = value
        elsif key.eql?("goals")
          @goals = value  
        end
      end

      record = Game.find(@game_id).hints.find_all_by_user_id_and_team_id(@user_id, @team_id)
      
      if record.empty?
        savedAll = create(@user_id, @team_id, @game_id, @goals)
      else
        updateGoals(record.first, @goals)
      end

    end

    respond_to do |format|
      Rails.logger.info('TESTE DE RETORNO DA VARIAVEL SAVED DO SAVEHINT')
      Rails.logger.info(savedAll)
      format.json { render json: {saved: savedAll} }
    end
  end

  def all_hints
    
    if !current_user.nil?
      @user = current_user
    end

    @games = Game.all(:include => :match_results, :order => 'gamedate ASC, gametime ASC')
    @users = User.all(:include => :hints, :order => 'name ASC, lastname ASC')

    respond_to do |format|
      format.html #all_hints
    end
  end

  def admin_all_hints

    if !current_user.nil?
      @user = current_user
    end
    
    @games = Game.all(:include => :match_results, :order => 'gamedate ASC, gametime ASC')
    @users = User.all(:include => :hints, :order => 'name ASC, lastname ASC')

    respond_to do |format|
      format.html #admin_all_hints
    end
  end

  def calculator
    games = Game.where(:closed => true).where(:finished => true).where(:computed => false)
    users = User.all

    Calculator::calculate(games, users)

    respond_to do |format|
      format.html
    end
  end

end

