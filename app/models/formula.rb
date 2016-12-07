class Formula < ApplicationRecord
  belongs_to :user
  has_one :additional_param, :dependent => :destroy
end
