class AdditionalParamsController < ApplicationController
  before_action :set_additional_param, only: [:show, :edit, :update, :destroy]

  # GET /additional_params
  # GET /additional_params.json
  def index
    @additional_params = AdditionalParam.all
  end

  # GET /additional_params/1
  # GET /additional_params/1.json
  def show
  end

  # GET /additional_params/new
  def new
    @additional_param = AdditionalParam.new
  end

  # GET /additional_params/1/edit
  def edit
  end

  # POST /additional_params
  # POST /additional_params.json
  def create
    @additional_param = AdditionalParam.new(additional_param_params)

    respond_to do |format|
      if @additional_param.save
        format.html { redirect_to @additional_param, notice: 'Additional param was successfully created.' }
        format.json { render :show, status: :created, location: @additional_param }
      else
        format.html { render :new }
        format.json { render json: @additional_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_params/1
  # PATCH/PUT /additional_params/1.json
  def update
    respond_to do |format|
      if @additional_param.update(additional_param_params)
        format.html { redirect_to @additional_param, notice: 'Additional param was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional_param }
      else
        format.html { render :edit }
        format.json { render json: @additional_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_params/1
  # DELETE /additional_params/1.json
  def destroy
    @additional_param.destroy
    respond_to do |format|
      format.html { redirect_to additional_params_url, notice: 'Additional param was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_param
      @additional_param = AdditionalParam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_param_params
      params.require(:additional_param).permit(:formula_id)
    end
end
