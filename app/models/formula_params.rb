class FormulaParams
  include ActiveModel::Model
  attr_accessor :r, :rd, :sigma, :k, :formula, :winstreak, :losestreak,
		:extra_params

end
