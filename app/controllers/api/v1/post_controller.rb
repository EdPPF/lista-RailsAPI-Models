class Api::V1::PostController < ApplicationController
  def create
    post = Post.new(post_params)
    post.save!
    render json: post, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def show
    pos = Post.find(params[:id])
    render json: pos, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :useradmin_id)
    end
end
