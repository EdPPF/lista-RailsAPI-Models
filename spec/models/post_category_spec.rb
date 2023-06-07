require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  context "Testing factory" do
    it "should create Post Category" do
      create(:post, id:1)
      expect(build(:post_category, post_id:1)).to be_valid
    end
  end

end
