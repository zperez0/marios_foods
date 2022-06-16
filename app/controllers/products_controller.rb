class ProductsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :edit, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    @products = Product.all
    render :index
  end

  def home
    @products_most_reviews = Product.most_reviews
    @products_local_product = Product.local_product
    @products_most_recent = Product.most_recent
    render :home
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:alert] = "Oops..Looks like there was an error in creating your product. Try again."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      flash[:notice] = "Product successfully updated"
      redirect_to products_path
    else
      flash[:alert] = "Oops..Looks like there was an error in updating your product. Try again."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def products_params
    params.require(:product).permit(:name, :country_of_orgin, :cost)
  end
end
