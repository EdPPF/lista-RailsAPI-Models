require 'rails_helper'

RSpec.describe "Api::V1::Commentaries", type: :request do
  describe "POST / create" do
    before do
      create(:post, id: 1, title:"Titulo1", content:"Conteudo1")
      create(:commentary, content:"McDonalds", user_id:20, post_id:1)
    end

    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/commentaries/create"
        expect(response).to have_http_status(:created)
      end
    end

    context "when params are nil" do
      post_params = nil
      it "return http status bad_request" do
        post "/api/v1/commentaries/create", params:{post: post_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
