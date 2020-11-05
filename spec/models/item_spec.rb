require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品がうまくいくとき' do
      it '全ての入力が行われたら出品できる' do
        expect(@item).to be_valid
      end
    end
    context '新規出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        
      end
      it 'nameが40文字以上だと登録できない' do
      
      end
      it 'priceが空だと登録できない' do
      
      end
      it 'prieが半角数字意外だと登録できない' do
      
      end
      it 'priceが300円以下だと登録できない' do
      
      end
      it 'priceが1000000以上だと登録できない' do
      
      end
      it 'explanationが空だと登録できない' do
      
      end
      it 'explanationが1000文字以上だと登録できない' do
      
      end
      it 'imageが空だと登録できない' do
      
      end
      it 'category_idが「---」だと登録できない' do
      
      end
      it 'status_idが「---」だと登録できない' do
      
      end
      it 'shipping_fee_idが「---」だと登録できない' do
      
      end
      it 'shipping_area_idが「---」だと登録できない' do
      
      end
      it 'shipping_day_idが「---」だと登録できない' do
      
      end
    end
  end
end
