require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Validating title" do
    it "should be invalid if title is nil" do
      expect(build(:post, title:nil)).to be_invalid
    end
  end
end
