require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  context "Testing factory" do
    it "should create Post Category" do
      expect(build(:post_category)).to be_valid
    end
  end

end
