class FormulasController < ApplicationController
  attr_reader :extra_points, :winstreak_boost, :losestreak_boost
  before_action :set_formula, :logged_in_user, 
	only: [:show, :update, :destroy, :edit]
  before_filter :check_creator, only: [:save, :update, :destroy]
  # GET /formulas
  # GET /formulas.json 
  def glicko?
    @formula[:glicko]
  end
  def winstreak?
    @formula[:winstreak]
  end
  def losestreak?
    @formula[:losestreak]
  end
  def new 
    @formula = current_user.formulas.new
  end
  
  def index
    @formulas = Formula.paginate(page: params[:page])
  end

  # GET /formulas/1
  # GET /formulas/1.json
  def show

  end

  # GET /formulas/1/edit
  def edit
  end

  # POST /formulas
  # POST /formulas.json
  def create
    @formula = current_user.formulas.new(formula_params)
    respond_to do |format|
      if @formula.save
        format.html { render :show, flash: {:success => "Formula successfully created"} }
        format.json { render :show, status: :created, location: @formula }
      else
        format.html { render :new }
        format.json { render json: @formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulas/1
  # PATCH/PUT /formulas/1.json
  def update
    respond_to do |format|
      if @formula.update(formula_params)
        format.html { render :show, flash: {:success => "Formula successfully updated"} }
        format.json { render :show, status: :ok, location: @formula }
      else
        format.html { render :edit }
        format.json { render json: @formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulas/1
  # DELETE /formulas/1.json
  def destroy
    @formula.destroy
    respond_to do |format|
      format.html { redirect_to formulas_url, flash: {:success => "Formula successfully destroyed"} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formula
      @formula = Formula.find(params[:id])
    end

    def check_creator
      current_user[:id] == :user_id
    end
    def formula_params
      params.require(:formula).permit(:user_id, :title, :extra_points, 
	:glicko, :winstreak, :losestreak, :winstreak_boost, 
	:losestreak_boost, :use_extra_params)
    end
end
