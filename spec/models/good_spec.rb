require 'rails_helper'
describe Good do
  describe '#create' do
    it "nameが空なら登録できない" do
      good = build(:good, name: nil)
      good.valid?
      expect(good.errors[:name]).to include("can't be blank")
    end
    it "conditionが空なら登録できない" do
      good = build(:good, condition: nil)
      good.valid?
      expect(good.errors[:condition]).to include("can't be blank")
    end
    it "discriptionが空なら登録できない" do
      good = build(:good, discription: nil)
      good.valid?
      expect(good.errors[:discription]).to include("can't be blank")
    end
    it "delivery_typeが空なら登録できない" do
      good = build(:good, delivery_type: nil)
      good.valid?
      expect(good.errors[:delivery_type]).to include("can't be blank")
    end
    it "prefectureが空なら登録できない" do
      good = build(:good, prefecture: nil)
      good.valid?
      expect(good.errors[:prefecture]).to include("can't be blank")
    end
    it "dayが空なら登録できない" do
      good = build(:good, day: nil)
      good.valid?
      expect(good.errors[:day]).to include("can't be blank")
    end
    it "feeが空なら登録できない" do
      good = build(:good, fee: nil)
      good.valid?
      expect(good.errors[:fee]).to include("can't be blank")
    end
    it "feeが数字でなければ登録できない" do
      good = build(:good, fee: "三百")
      good.valid?
      expect(good.errors[:fee]).to include("無効な値です")
    end
    it "feeが300未満であれば登録できない" do
      good = build(:good, fee: 299)
      good.valid?
      expect(good.errors[:fee]).to include("無効な値です")
    end
    it "feeが9999999未満でなければ登録できない" do
      good = build(:good, fee: 10000000)
      good.valid?
      expect(good.errors[:fee]).to include("無効な値です")
    end
  end
end