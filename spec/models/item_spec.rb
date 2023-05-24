require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    sleep 0.1
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it 'name、category_id、condition_id、shipping_burden_id、prefecture_id、introduction、expected_shipping_date_id、price、itemが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_burden_idが空では登録できない' do
        @item.shipping_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'expected_shipping_date_idが空では登録できない' do
        @item.expected_shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Expected shipping date can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userと紐づいていないと登録できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300から9999999までの半角整数で入力してください")
      end
      it 'priceが299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300から9999999までの半角整数で入力してください")
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300から9999999までの半角整数で入力してください")
      end
    end

  end


end
