require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "Testing factory" do
    it "should create feedback" do
      expect(build(:feedback)). to be_valid
    end
  end

end
