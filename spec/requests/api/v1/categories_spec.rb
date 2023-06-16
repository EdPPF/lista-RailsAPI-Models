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
end
