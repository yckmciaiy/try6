class Formula < ApplicationRecord
  belongs_to :user
  has_many :extra_params, :inverse_of => :formula, :dependent => :destroy
  
  validates :title,  presence: true
  validates :extra_points, numericality: {only_integer: true,
	 greater_than_or_equal_to: 1}, if: :use_extra_params
  validates :winstreak_boost, numericality: {greater_than: 1, 
	less_than_or_equal_to: 3}, if: :winstreak
  validates :losestreak_boost, numericality: {greater_than: 1,
	less_than_or_equal_to: 3}, if: :losestreak
end
