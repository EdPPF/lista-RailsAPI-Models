class Api::V1::FeedbacksController < ApplicationController
  def create
    feed = Feedback.new(feedback_params)
    feed.save!
    render json: feed, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
    feedbs = Feedback.all
    render json: feedbs, status: :ok
  end

  def show
    feedb = Feedback.find(params[:id])
    render json: feedb, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def feedback_params
      params.require(:feedback).permit(:like, :user_id, :post_id)
    end
end
