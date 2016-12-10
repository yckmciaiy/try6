class FormulaParams
  include ActiveModel::Model
  attr_accessor :r, :rd, :sigma, :k, :formula

  validates :r,
            presence: true

  validates :rd,
            :sigma,
            presence: true,
            if: ->(formula_params) { formula_params.glicko? }

  validates :k,
            presence: true,
            if: ->(formula_params) { !formula_params.glicko? }

  def self.wrap(formula, params)
    params.map {|p| new(p.merge(formula: formula))  }
  end

  def glicko?
    formula.glicko?
  end

  def calculate_results!
    # magic happens here
    if formula.glicko?
      :glicko_result
    else
      :elo_result
    end
  end
end