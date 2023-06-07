require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it "should be valid" do
      expect(build(:category)).to be_valid
    end
  end

  # name string [not null, unique]
  context "Validating name" do
    it "should be invalid if name is nil" do
      expect(build(:category, name:nil)).to be_invalid
    end
  end

  # description text [not null, unique]
end
