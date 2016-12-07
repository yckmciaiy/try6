class User < ApplicationRecord
  has_many :formulas, :dependent => :destroy
end
