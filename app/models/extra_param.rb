class ExtraParam < ApplicationRecord
  belongs_to :formula, :inverse_of => :extra_params
  validates :title, :uniqueness => :true
  validates :weight, numericality: 
	{greater_than_or_equal_to: 1, less_than_or_equal_to: 100}

end
