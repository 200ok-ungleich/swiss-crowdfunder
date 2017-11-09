require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe 'Timing' do

    it 'is not active when the start is in the future' do
      campaign = FactoryBot.build :campaign, start_date: 100.days.from_now
      expect(campaign.is_active?).to eq(false)
    end

    it 'is not active when the end is in the past' do
      campaign = FactoryBot.build :campaign, end_date: 100.days.ago
      expect(campaign.is_active?).to eq(false)
    end

    it 'is active when the time is between start and end dates' do
      campaign = FactoryBot.build :campaign,
        start_date: 1.day.ago,
        end_date: 1.day.from_now
      expect(campaign.is_active?).to eq(true)
    end

    it 'is active when it starts today' do
      campaign = FactoryBot.build :campaign,
        start_date: Date.today,
        end_date: 1.day.from_now
      expect(campaign.is_active?).to eq(true)
    end

    it 'is active when it ends today' do
      campaign = FactoryBot.build :campaign,
        start_date: 100.days.ago,
        end_date: Date.today
      expect(campaign.is_active?).to eq(true)
    end




  end



  describe 'Amount raised' do
    it 'works for zero orders' do
      campaign = FactoryBot.create :campaign
      FactoryBot.create :goody
      expect(campaign.amount_raised).to eq(0)
    end

    it 'works for one goody/one order' do
      campaign = FactoryBot.create :campaign
      goody = FactoryBot.create :goody, campaign: campaign
      supporter = FactoryBot.build :supporter
      goody.orders.create! payment_type: 'stripe',
        quantity: 1,
        amount: 123,
        agreement: true,
        supporter: supporter
      expect(campaign.amount_raised).to eq(123)
    end

    it "works for multiple goodies/orders" do
      campaign = FactoryBot.create :campaign
      goody1 = FactoryBot.create :goody, campaign: campaign
      goody2 = FactoryBot.create :goody, campaign: campaign
      goody3 = FactoryBot.create :goody, campaign: campaign, quantity: 2
      supporter = FactoryBot.build :supporter
      goody1.orders.create! payment_type: "stripe", quantity: 1, amount: 10, agreement: true,
        supporter: supporter
      # goody2 has no orders
      goody3.orders.create! payment_type: "stripe", quantity: 1, amount: 30, agreement: true,
        supporter: supporter
      goody3.orders.create! payment_type: "stripe", quantity: 1, amount: 40, agreement: true,
        supporter: supporter
      expect(campaign.amount_raised).to eq(80)
    end
  end

end
