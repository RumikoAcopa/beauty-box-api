class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  
  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    #render json: @product
    hash = ProductSerializer.new(@product, include: [:category]).serializable_hash
    render json: { 
      product: hash[:data][:attributes],
      category: hash[:included].map(|category| category[:attributes])
    }  end

  end

  # POST /products
  def create
    @product = current_user.products.build(product_params)
    
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :quantity, :details, :user_id, :category_id)
    end
end
