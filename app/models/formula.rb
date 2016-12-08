class Formula < ApplicationRecord
  belongs_to :user
  validates :title,  presence: true
  validates :win_points, numericality: {only_integer: true,
	 greater_than_or_equal_to: 2, less_than_or_equal_to: 100}
  validates :lose_points, numericality: {only_integer: true,
	 greater_than_or_equal_to: 2, less_than_or_equal_to: 100}  
  validates :winstreak_boost, numericality: {greater_than: 1, 
	less_than_or_equal_to: 3}, if: :winstreak
  validates :losestreak_boost, numericality: {greater_than: 1,
	less_than_or_equal_to: 3}, if: :losestreak
end
