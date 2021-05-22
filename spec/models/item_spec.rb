require 'rails_helper'
RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

    describe '商品出品機能' do
      context '商品が出品できるとき' do
        it '全て適切な情報が入力されると出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品が出品できないとき' do
        it 'imageがnilでは出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'titleが空では出品できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it 'descriptionが空では出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが空では保存できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'condition_idが空では出品できない' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it 'delivery_feeが空では出品できない' do
          @item.delivery_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it 'prefecture_idが空では出品できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'scheduled_deliveryが空では出品できない' do
          @item.scheduled_delivery_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end
        it 'priceが空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが299以下では出品できない' do
          @item .price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが10000000以上では出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceが全角数字では出品できない' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
