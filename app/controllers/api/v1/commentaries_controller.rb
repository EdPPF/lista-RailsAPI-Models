class Api::V1::CommentariesController < ApplicationController
  def create
    commen = Commentary.new(commentary_params)
    commen.save!
    render json: commen, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  private
    def commentary_params
      params.require(:commentary).permit(:content, :user_id, :post_id)
    end
end
