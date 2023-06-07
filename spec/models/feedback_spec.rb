require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "Testing factory" do
    it "should create feedback" do
      create(:post, id:2)
      expect(build(:feedback, post_id:2)). to be_valid
    end
  end

end
