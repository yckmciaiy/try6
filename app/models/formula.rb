class Formula < ApplicationRecord
  belongs_to :user
  has_many :additional_params, :dependent => :destroy
end
