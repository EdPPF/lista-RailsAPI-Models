class Api::V1::CommentariesController < ApplicationController

  private
    def commentary_params
      params.require(:commentary).permit(:name, :description)
    end
end
