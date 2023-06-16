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
end
