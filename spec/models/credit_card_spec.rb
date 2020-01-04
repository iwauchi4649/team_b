require 'rails_helper'

  describe CreditCard do
    describe "#create" do
      # it "全て入力する" do
      #   creditcard = build(:credit_card)
      #   expect(creditcard).to be_valid
      # end
      # it "user_idが空では登録できない" do
      #   creditcard= build(:credit_card, user_id: nil)
      #   expect(creditcard.errors[:user]).to be_present
      #   expect(creditcard.errors[:user]).to include("user_idが空です。")
      # end
  
      # it "card_numberが空では登録できない" do
      #   creditcard= build(:credit_card, card_number: nil)
      #   creditcard.valid?
      #   expect(creditcard.errors[:card_number]).to include("card_numberが空です。")
      # end
  
      # it "expiration_date_monthが空では登録できない" do
      #   creditcard= build(:credit_card, expiration_date_month: nil)
      #   creditcard.valid?
      #   expect(creditcard.errors[:expiration_date_month]).to include("expiration_date_monthが空です。")
      # end
  
      # it "expiration_date_yearが空では登録できない" do
      #   creditcard= build(:credit_card, expiration_date_year: nil)
      #   creditcard.valid?
      #   expect(creditcard.errors[:expiration_date_year]).to include("expiration_date_yearが空です。")
      # end
  
      # it "security_codeが空では登録できない" do
      #   creditcard= build(:credit_card, security_code: nil)
      #   creditcard.valid?
      #   expect(creditcard.errors[:security_code]).to include("security_codeが空です。")
      # end
    end
end
