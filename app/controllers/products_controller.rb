class ProductsController < ApplicationController
  def index
    case
    when params[:sort] == "most_reviews"
      @products = Product.most_reviews
    when params[:sort] == "local_product"
      @products = Product.local_product
    when params[:sort] == "most_recent"
      @products = Product.most_recent
    else
      @products = Product.all
    end
    render :index
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