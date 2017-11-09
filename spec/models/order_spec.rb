require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'security' do

    it 'is not possible to buy when there are no goodies left' do
      goody = FactoryBot.create :goody, quantity: 0
      order = FactoryBot.build :order, goody: goody
      expect(order).to_not be_valid
      expect(order.errors.first).to eq([:goody, "No goodies left!"])
    end

    it 'is possible to buy as long as there are goodies left' do
      goody = FactoryBot.create :goody, quantity: 3
      # Buying the first three works
      3.times do
        order = FactoryBot.build :order, goody: goody
        expect(order).to be_valid
        order.save!
      end

      # When there are no more goodies left
      order = FactoryBot.build :order, goody: goody
      expect(order).to_not be_valid
      expect(order.errors.first).to eq([:goody, "No goodies left!"])
    end

  end
end
