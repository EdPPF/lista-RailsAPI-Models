require 'rails_helper'

RSpec.describe Commentary, type: :model do
  context "Testing factory" do
    it "should be valid" do
      expect(build(:commentary)).to be_valid
    end
  end



end
