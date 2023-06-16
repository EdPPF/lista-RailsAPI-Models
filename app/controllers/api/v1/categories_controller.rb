class Api::V1::CategoriesController < ApplicationController
  def create
    categor = Category.new(category_params)
    categor.save!
    render json: categor, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
     categs = Category.all
     render json: categs, status: :ok
  end

  def show
    categ = Category.find(params[:id])
    render json: categ, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def update
    categ = Category.find(params[:id])
    categ.update!(category_params)
    render json: categ, status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def delete
    cat = Category.find(params[:id])
    cat.destroy!
    render json: {message: "Object destroyed."}, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
