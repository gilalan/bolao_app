class MatchResultsController < ApplicationController
  # GET /match_results
  # GET /match_results.json
  def index
    @match_results = MatchResult.all(:order => 'id ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_results }
    end
  end

  # GET /match_results/1
  # GET /match_results/1.json
  def show
    @match_result = MatchResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match_result }
    end
  end

  # GET /match_results/new
  # GET /match_results/new.json
  def new
    @match_result = MatchResult.new
    @teams = Team.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match_result }
    end
  end

  # GET /match_results/1/edit
  def edit
    @match_result = MatchResult.find(params[:id])
    @teams = Team.all
  end

  # POST /match_results
  # POST /match_results.json
  def create
    @match_result = MatchResult.new(params[:match_result])

    respond_to do |format|
      if @match_result.save
        format.html { redirect_to @match_result, notice: 'Match result was successfully created.' }
        format.json { render json: @match_result, status: :created, location: @match_result }
      else
        format.html { render action: "new" }
        format.json { render json: @match_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /match_results/1
  # PUT /match_results/1.json
  def update
    @match_result = MatchResult.find(params[:id])

    respond_to do |format|
      if @match_result.update_attributes(params[:match_result])
        format.html { redirect_to @match_result, notice: 'Match result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_results/1
  # DELETE /match_results/1.json
  def destroy
    @match_result = MatchResult.find(params[:id])
    @match_result.destroy

    respond_to do |format|
      format.html { redirect_to match_results_url }
      format.json { head :no_content }
    end
  end
end
