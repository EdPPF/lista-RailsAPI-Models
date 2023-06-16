require 'rails_helper'

RSpec.describe "Api::V1::Commentaries", type: :request do
  describe "POST / create" do
    before do
      create(:post, id: 1, title:"Titulo1", content:"Conteudo1")
      #create(:commentary, content:"McDonalds", user_id:20, post_id:1)
    end
    let(:commentary_params) do
      attributes_for(:commentary)
    end

    context "when params are ok" do
      commentary_params = {post_id: 1, user_id:20, content:"AA"}
      it "return http status created" do
        post "/api/v1/commentaries/create", params:{commentary: commentary_params}
        expect(response).to have_http_status(:created)
      end
    end

    context "when params are nil" do
      commentary_params = nil
      it "return http status bad_request" do
        post "/api/v1/commentaries/create", params:{commentary: commentary_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
