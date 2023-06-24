class Api::V1::CommentariesController < ApplicationController
  acts_as_token_authentication_handler_for User, only:[:create, :update, :delete]
  before_action :admin_authentication, only:[:create, :update, :delete]

  def create
    commen = Commentary.new(commentary_params)
    commen.save!
    render json: commen, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
    comments = Commentary.all
    render json: comments, status: :ok
  end

  def show
    comme = Commentary.find(params[:id])
    render json: comme, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def update
    comm = Commentary.find(params[:id])
    comm.update!(commentary_params)
    render json: comm, status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def delete
    come = Commentary.find(params[:id])
    come.destroy!
    render json: {message: "Object destroyed."}, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def commentary_params
      params.require(:commentary).permit(:content, :user_id, :post_id)
    end
end
