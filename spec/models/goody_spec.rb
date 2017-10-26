require 'rails_helper'

RSpec.describe Goody, type: :model do

  describe 'remaining quantity' do

    it 'initially is the initial quantity' do
      goody = FactoryBot.create :goody, quantity: 100
      expect(goody.orders_count).to eq(0)
      expect(goody.remaining_quantity).to eq(100)
    end

    it 'remaining quantity is less if there are orders' do
      goody = FactoryBot.create :goody, quantity: 100
      3.times { FactoryBot.create :order, goody: goody }

      expect(goody.remaining_quantity).to eq(97)
    end


  end
end
