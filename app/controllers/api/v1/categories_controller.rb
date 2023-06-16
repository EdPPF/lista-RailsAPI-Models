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

  private
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
