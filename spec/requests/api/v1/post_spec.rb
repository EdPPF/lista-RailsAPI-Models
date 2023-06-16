require 'rails_helper'

RSpec.describe "Api::V1::Post", type: :request do
  describe "POST / create" do
    let(:post_params) do
      attributes_for(:post)
    end

    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/post/create", params:{post: post_params}
        expect(response).to have_http_status(:created)
      end
    end

    context "when params are nil" do
      post_params = nil
      it "return http status bad_request" do
        post "/api/v1/post/create", params:{post: post_params}
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

  describe "GET / index" do
    before do
      create(:post, title:"TituloA", content:"ConteudoA")
    end
    context "when post is created" do
      it "returns htpps status ok" do
        get "/api/v1/post/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/post/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      # Isso aqui não foi lá uma boa ideia pra agora...
      # it "returns a the created instances" do
      #   get "/api/v1/post/index"
      #   expect(JSON.parse(response.body)).to eq([{
      #     'title' => "TituloA",
      #     'content' => "ConteudoA"
      #   }])
      # end
    end
  end

  describe "GET / show/:id" do
    let(:posta) {create(:post, title:"Titulo", content:"Conteudo")}
    let(:post_params) do
      attributes_for(:post)
    end

    context "when post exists" do
      it "returns http status ok" do
        get "/api/v1/post/show/#{posta.id}", params:{post: post_params}
        expect(response).to have_http_status(:ok)
      end
    end

    context "when post does not exist" do
      it "returns http status not_found" do
        get "/api/v1/post/show/42"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH / update:/id" do
    let(:posto) {create(:post, title:"Titulo", content:"Conteudo")}
    # let(:post_params) do
    #   attributes_for(:post)
    # end

    context "when params are ok" do
      it "returns http status ok" do
        patch "/api/v1/post/update/#{posto.id}", params:{post: {title:"Zelda e Bom", content:"Eu ainda nao zerei"}}
        expect(response).to have_http_status(:ok)
      end
    end

    context "when params are nil" do
      it "returns https status bad_request" do
        patch "/api/v1/post/update/#{posto.id}", params:{post: {title:nil, content:nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
