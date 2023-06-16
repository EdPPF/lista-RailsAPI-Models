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

  describe "GET / index" do
    before do
      create(:post, id: 2, title:"TituloA", content:"ConteudoA")
      create(:commentary, content:"McDonalds", user_id:20, post_id:2)
    end
    context "when comment is created" do
      it "returns https status ok" do
        get "/api/v1/commentaries/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/commentaries/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "GET / show/:id" do
    before do
      create(:post, id: 3, title:"._.", content:"conteudo")
      create(:commentary, id: 2, content: "cont", user_id: 351, post_id: 3)
    end

    context "when comment exists" do
      it "returns http status ok" do
        get "/api/v1/commentaries/show/2"
        expect(response).to have_http_status(:ok)
      end
    end

    context "when comment does not exist" do
      it "returns http status not_found" do
        get "/api/v1/commentaries/show/-1"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
