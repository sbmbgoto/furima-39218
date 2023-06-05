require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '購入フォーム' do
    context '内容に問題ない場合' do
      it "user_id、item_id、token、prefecture_id、city、addresses、phone_number、post_code、order_idがあれば保存ができる" do
        expect(@item_order).to be_valid
      end
      it "buildingが空でも登録できる" do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "userが紐づいていないと登録できない" do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Userを入力してください")
      end
      it "itemが紐づいていないと登録できない" do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Itemを入力してください")
      end
      it "tokenが空では登録できないこと" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it "prefecture_idが初期値では登録できない" do
        @item_order.prefecture_id = '1'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("都道府県を選択してください")
      end
      it "cityが空では登録できない" do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it "addressesが空では登録できない" do
        @item_order.addresses = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("番地を入力してください")
      end
      it "phone_numberが空では登録できない" do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "phone_numberが9桁以下では登録できない" do
        @item_order.phone_number = '123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号は10文字以上で入力してください")
      end
      it "phone_numberが12桁以上では登録できない" do
        @item_order.phone_number = '123456789012'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it "phone_numberが全角数字では登録できない" do
        @item_order.phone_number = '１２３４５６７８９０'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号は10～11桁の半角数字で入力してください")
      end
      it "post_codeが空では登録できない" do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "post_codeにハイフンが含まれていないと登録できない" do
        @item_order.post_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号はハイフンを含めた半角数字で入力してください")
      end
      it "post_codeが全角数字では登録できない" do
        @item_order.post_code = '１２３ー４５６７'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号はハイフンを含めた半角数字で入力してください")
      end
    end
  end
end
