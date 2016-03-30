class ProductsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json{ render json: Product.all }
    end
  end
  def destroy
    Product.destroy(params[:id])
    render json: {success: true}, status: :ok
  end
  def create
    @product = Product.create(product_params)
    render json: @product, status: :ok
  end
  private
  def product_params
    params.require(:product).permit(:name, :image_url, :cost, :quantity, :country)
  end
end
