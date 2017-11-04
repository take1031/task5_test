class UsersController < ApplicationController
	  before_action :set_user, only: [ :destroy]
	  before_action :authenticate_user!
	  before_action :current_user, only: [:edit, :update]
	  before_action :set_current_user


	def set_current_user
	  @current_user = User.find_by(id: session[:user_id])
	end

  def index
    @users = User.all
  end

	def show
      # @post = Post.find_by(id: params[:id])
      @user = User.find(params[:id])
  end
    
  def edit
	  @user = User.find(params[:id])
	  # render :layout => 'users'
	end
	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "プロフィールを更新しました"
    else
      render'edit'
    end
  end

  def destroy

  end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:title, :body, :user_id, :image, :interest_list )
    end

    def correct_user
      post = Post.find(params[:id])
      if current_user.id != post.user_id
        redirect_to root_path
      end

      
    end
end

