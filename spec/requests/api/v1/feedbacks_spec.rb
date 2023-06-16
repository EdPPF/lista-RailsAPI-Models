require 'rails_helper'

RSpec.describe "Api::V1::Feedbacks", type: :request do
  describe "POST / create" do
    let(:feedback_params) do
      attributes_for(:feedback)
    end

    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/feedbacks/create", params:{feedback: feedback_params}
        expect(response).to have_http_status(:created)
      end
    end
  end
end
