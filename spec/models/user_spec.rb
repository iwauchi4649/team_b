require 'rails_helper'
describe User do
  describe '#create' do
    it "全てを入力する" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "emailが空では登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).not_to include("emailが空です。")
    end

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).not_to include("can't be blank")
    end

    it "name_fullが空では登録できない" do
      user = build(:user, name_full: nil)
      user.valid?
      expect(user.errors[:name_full]).not_to include("can't be blank")
    end

    it "name_canaが空では登録できない" do
      user = build(:user, name_cana: nil)
      user.valid?
      expect(user.errors[:name_cana]).not_to include("can't be blank")
    end

    it "birth_yearが空では登録できない" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).not_to include("can't be blank")
    end

    it "birth_monthが空では登録できない" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).not_to include("can't be blank")
    end

    it "birth_dayが空では登録できない" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).not_to include("can't be blank")
    end

    it "call_numberが空では登録できない" do
      user = build(:user, call_number: nil)
      user.valid?
      expect(user.errors[:call_number]).not_to include("can't be blank")
    end

    it "pointが空では登録できない" do
      user = build(:user, point: nil)
      user.valid?
      expect(user.errors[:point]).not_to include("can't be blank")
    end
    
    it "passwordが空では登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).not_to include("空ではできない")
    end
  end
end