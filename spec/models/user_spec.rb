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
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "firstname_fullが空では登録できない" do
      user = build(:user, firstname_full: nil)
      user.valid?
      expect(user.errors[:firstname_full]).to include("can't be blank")
    end

    it "lastname_fullが空では登録できない" do
      user = build(:user, lastname_full: nil)
      user.valid?
      expect(user.errors[:lastname_full]).to include("can't be blank")
    end
    it "firstname_canaが空では登録できない" do
      user = build(:user, firstname_cana: nil)
      user.valid?
      expect(user.errors[:firstname_cana]).to include("can't be blank")
    end
    it "lastname_canaが空では登録できない" do
      user = build(:user, lastname_cana: nil)
      user.valid?
      expect(user.errors[:lastname_cana]).to include("can't be blank")
    end

    it "birth_dayが空では登録できない" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "pointが空では登録できない" do
      user = build(:user, point: nil)
      user.valid?
      expect(user.errors[:point]).to include("can't be blank")
    end
  end
end