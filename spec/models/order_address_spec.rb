require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it '全ての情報を入力したとき' do
        expect(@order_address).to be_valid
      end
      it 'building_numberが空でも購入できる' do
        @order_address.building_number = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品の購入がうまくいかないとき' do
      it '正しいカード情報が入力されなかったとき' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空のとき' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は( - )をお入れ下さい")
      end
      it 'postal_codeに（ー）がないとき' do
        @order_address.postal_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は( - )をお入れ下さい")
      end
      it 'prefectures_idが（０）のとき' do
        @order_address.prefectures_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は[---]意外をお選び下さい")
      end
      it 'municipalityが空のとき' do
        @order_address.municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空のとき' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空のとき' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は半角英数字でご入力下さい")
      end
      it 'phone_numberに（ー）があるとき' do
        @order_address.phone_number = '090-123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角英数字でご入力下さい")
      end
      it 'phone_numberが12桁以上のとき' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角英数字でご入力下さい")
      end
    end
  end
end
