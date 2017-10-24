require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe "Amount raised" do
    it "works for zero orders" do
      campaign = FactoryBot.create :campaign
      goody = FactoryBot.create :goody
      expect(campaign.amount_raised).to eq(0)
    end

    it "works for one goody/one order" do
      campaign = FactoryBot.create :campaign
      goody = FactoryBot.create :goody, campaign: campaign
      supporter = Supporter.new first_name: "John", last_name: "Doe", date_of_birth: 18.years.ago
      goody.orders.create! payment_type: "stripe",
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
      goody3 = FactoryBot.create :goody, campaign: campaign
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
