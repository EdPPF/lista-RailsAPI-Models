require 'rails_helper'

RSpec.describe "Api::V1::Feedbacks", type: :request do
  describe "POST / create" do
    before do
      create(:post, id: 1, title:"POSTE", content:"contente")
    end
    feedback_params = {like: true, user_id: 42, post_id: 1}

    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/feedbacks/create", params:{feedback: feedback_params}
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "GET / index" do
    before do
      create(:post, id: 2, title:"POSTE", content:"contente")
      create(:feedback, like: true, user_id: 42, post_id: 2)
    end

    context "when feedback is created" do
      it "returns http status ok" do
        get "/api/v1/feedbacks/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/feedbacks/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
