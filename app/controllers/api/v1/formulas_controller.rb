class Api::V1::FormulasController < Api::V1::BaseController
  def calculate
    formula = Formula.find(calculate_params[:formula_id])
    formula_params = FormulaParams.wrap(formula, calculate_params[:formula_params])
    formula_params.map(&:validate!)
    @results = formula_params.map(&:calculate_results!)
  end

  def calculate_params
    params.permit(:formula_id, formula_params: [:r, :rd, :k, :sigma])
  end
end
