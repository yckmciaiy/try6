class Api::V1::UsersController < Api::V1::BaseController
  def all
    @users = User.all.includes(:access_keys)
  end
end
