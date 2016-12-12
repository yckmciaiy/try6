class ExtraParamsController < ApplicationController
  attr_reader :weight

  before_action :set_extra_param, only: [:show, :edit, :update, :destroy]
  # GET /extra_params
  # GET /extra_params.json
  def index
    @extra_params = ExtraParam.all
  end

  # GET /extra_params/1
  # GET /extra_params/1.json
  def show
  end

  # GET /extra_params/new
  def new
    current_formula_id = params[:formula_id]
    current_formula = Formula.find(current_formula_id)
    @extra_param = current_formula.extra_params.new()
  end

  # GET /extra_params/1/edit
  def edit
  end

  # POST /extra_params
  # POST /extra_params.json
  def create
    tmp = params[:extra_param]
    current_formula_id = tmp[:formula_id]
    current_formula = Formula.find_by(id: 
	current_formula_id)
    @extra_param = current_formula.extra_params.new(extra_param_params)
    respond_to do |format|
      if @extra_param.save
        format.html { redirect_to formula_path (current_formula_id), 
	flash: {success: "Formula successfully created"} }
        format.json { render :show, status: :created, location: @extra_param }
      else
        format.html { render :new }
        format.json { render json: @extra_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_params/1
  # PATCH/PUT /extra_params/1.json
  def update
    tmp = params[:extra_param]
    current_formula_id = tmp[:formula_id]
    respond_to do |format|
      if @extra_param.update(extra_param_params)
        format.html { redirect_to formula_path (current_formula_id), 
	flash: {success: "Extra param successfully updated"} }
        format.json { render :show, status: :ok, location: @extra_param }
      else
        format.html { render :edit }
        format.json { render json: @extra_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extra_params/1
  # DELETE /extra_params/1.json
  def destroy
    current_formula_id = @extra_param[:formula_id]
    @extra_param.destroy
    respond_to do |format|
      format.html { redirect_to formula_path (current_formula_id), 
	flash: {success: "Extra param successfully destroyed"} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_param
      @extra_param = ExtraParam.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def extra_param_params
      params.require(:extra_param).permit(:title, :weight, :formula_id)
    end
end
