require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "POST / create" do
    let(:categoryA) {create(:category, name:"NOME", description:"DESC")}
    let(:category_params) do
      attributes_for(:category)
    end

    context "when params are ok" do
      it "returns http status created" do
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:created)
      end
    end

    context "when params are nil" do
      category_params = nil
      it "returns http status bad_request" do
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "when params are repeated" do
      it "returns https status bad_request" do
        post "/api/v1/categories/create", params:{category: category_params}
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET / index" do
    before do
      create(:category, name:"Nomu", description:"Descript")
    end
    context "when category is created" do
      it "returns https status ok" do
        get "/api/v1/categories/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/categories/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
