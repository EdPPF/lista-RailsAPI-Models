require 'rails_helper'

RSpec.describe Commentary, type: :model do
  context "Testing factory" do
    it "should create commentary" do
      create(:post, id:1)
      expect(build(:commentary, post_id:1)).to be_valid
    end
  end

  context "Validating content" do
    it "should be invalid if nil" do
      expect(build(:commentary, content:nil)).to be_invalid
    end
  end

end
