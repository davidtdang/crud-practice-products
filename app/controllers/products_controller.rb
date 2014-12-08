class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was created successfully' }
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was updated successfully'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to products_path, notice: 'Product was deleted'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
      :name,
      :description,
      :price,
      )
    end


end
