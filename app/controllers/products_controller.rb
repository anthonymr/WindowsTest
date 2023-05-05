class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc).with_attached_photo
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
    if product.save
      redirect_to products_path, notice: 'Product created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    product
  end

  def update
    if product.update(product_params)
      redirect_to products_path, notice: 'Product updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if product.destroy
      redirect_to products_path, notice: 'El producto fue eliminado con éxito'
    else
      redirect_to products_path, notice: 'El producto no pudo ser eliminado'
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end

  def product
    @product = Product.find(params[:id])
  end
end
