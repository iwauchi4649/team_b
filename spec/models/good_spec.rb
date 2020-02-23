require 'rails_helper'
describe Good do
  describe '#create' do
    it "is invalid without a name" do
      good = build(:good, name: nil)
      good.valid?
      expect(good.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a condition" do
      good = build(:good, condition: nil)
      good.valid?
      expect(good.errors[:condition]).to include("can't be blank")
    end
  end
end