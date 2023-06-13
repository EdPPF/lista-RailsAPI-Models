require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "POST / create" do
    let(:post_params) do
      attributes_for(:post)
    end
    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/posts/create", params:{post: post_params}
        expect(response).to have_http_status(:created)
      end
    end
  end
end
