class UsersController < ApplicationController
  def index
  	@users = User.where(activated: FILL_IN).paginate(page: params[:page])
   end
  	
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])

  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
