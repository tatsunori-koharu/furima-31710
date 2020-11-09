require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it '全ての情報を入力したとき' do
        expect(@order_address).to be_valid
      end
      it 'building_numberが空でも購入できる' do
      end
    end
    context '商品の購入がうまくいかないとき' do
      it 'カード番号が空のとき' do
      end
      it 'exp_monthが空のとき' do
      end
      it 'exp_yearが空のとき' do
      end
      it 'cvcが空のとき' do
      end
      it 'postal_codeが空のとき' do
      end
      it 'postal_codeに（ー）がないとき' do
      end
      it 'prefectures_idが（０）のとき' do
      end
      it 'municipalityが空のとき' do
      end
      it 'addressが空のとき' do
      end
      it 'phone_numberが空のとき' do
      end
      it 'phone_numberが半角数字ではないとき' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
    end
  end
end
