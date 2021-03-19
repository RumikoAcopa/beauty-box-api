class CategoriesController < ApplicationController
  before_action :set_category, only: [:create, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  def show
    hash = CategorySerializer.new(@category, include: [:product]).serializable_hash
    render json: { 
      category: hash[:data][:attributes],
      product: hash[:included].map(|category| category[:attributes])
     }  end
  end

  # POST /categories
  def create
     @category = current_user.categories.build(category_params)

    if  category.save
      render json:  category, status: :created, location:  category
    else
      render json:  category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if  category.update(category_params)
      render json:  category
    else
      render json:  category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
     category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set category
       category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(category).permit(:name, :user_id)
    end
end
