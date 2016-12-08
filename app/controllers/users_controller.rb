class UsersController < ApplicationController
  attr_accessor :id
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, except: [:index, :new, :create]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @formulas = @user.formulas.paginate(page: params[:page])
  end

  def new
    if logged_in?
      redirect_to current_user
    end
    @user = User.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, flash: {success: "Profile updated"} }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, flash: {success: "User deleted"} }
      format.json { head :no_content }
    end
  end
  def give_admin
    @user.admin = true if !current_user?(@user)&&current_user.admin?
    render @user
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      return @user = User.find(params[:id || :username]) unless params[:id].nil?
      new
    end

    def user_params
      params.require(:user).
	permit(:username, :name, :email, :password, :password_confirmation)
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)||current_user.admin?
    end
end
