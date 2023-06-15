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

  # Não sei quais testes fazer aqui...
  # describe "GET / index" do
  #   before do
  #     titulo = "Como criar e testar Controllers"
  #     conteudo = "Eu não sei como, na verdade."
  #     create(:post, title:titulo, content:conteudo)
  #   end
  # end

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
end
