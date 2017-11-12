class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :current_user, only: [:edit, :update]
  before_action :set_current_user

def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end

  # GET /posts
  # GET /posts.json
  def index
    @products = Product.page(params[:page]).per(50)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @product = Product.find_by(id: params[:id])
    @user = User.find_by(id: @product.user_id)
  end

  # GET /posts/new
  def new
    @product = Product.new
  end

  # GET /posts/1/edit
  def edit
    @user = User.find(params[:id])
    render :layout => 'users'
  end

  # POST /posts
  # POST /posts.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: '投稿されました！' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: '投稿が更新されました！' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "プロフィールを更新しました"
    else
      render'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '投稿が削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :user_id, :image, :price )
    end

    def correct_user
      product = Product.find(params[:id])
      if current_user.id != product.user_id
        redirect_to products_path
      end

      
    end
end

