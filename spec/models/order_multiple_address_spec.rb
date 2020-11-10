require 'rails_helper'

RSpec.describe OrderMultipleAddress, type: :model do
  before do
    @order_multiple_address = FactoryBot.build(:order_multiple_address)
  end

  describe '購入記録、住所の保存' do
    context '購入記録、住所が保存できる場合' do
      it '必要な情報が入力されていれば購入記録、住所の保存ができる' do
        expect(@order_multiple_address).to be_valid
      end

      it 'buildingが空の場合保存できる' do
        @order_multiple_address.building = ''
        expect(@order_multiple_address).to be_valid
      end
    end

    context '購入記録、住所が保存できない場合' do
      it 'postal_codeが空の場合保存できない' do
        @order_multiple_address.postal_code = ''
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeには-が必要であること' do
        @order_multiple_address.postal_code = '11111111'
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'municipalitiesが空の場合保存できない' do
        @order_multiple_address.municipalities = ''
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空の場合保存できない' do
        @order_multiple_address.address = ''
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがからの場合保存できない' do
        @order_multiple_address.phone_number = ''
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以内でないと保存できない' do
        @order_multiple_address.phone_number = '111111111111'
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include('Phone number Must be within 11 digits')
      end

      it 'prefecture_idが空の場合保存できない' do
        @order_multiple_address.prefecture_id = ''
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it 'prefecture_idが1の場合保存できない' do
        @order_multiple_address.prefecture_id = 1
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'tokenが空の場合保存できない' do
        @order_multiple_address.token = ''
        @order_multiple_address.valid?
        expect(@order_multiple_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
