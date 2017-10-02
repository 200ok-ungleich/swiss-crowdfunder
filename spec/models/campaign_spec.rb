require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe "Amount raised" do
    it "works for zero orders" do
      campaign = Campaign.create! title: "foo", description: "bar"
      goody = Goody.create! title: "goody1", campaign: campaign
      expect(campaign.amount_raised).to eq(0)
    end

    it "works for one goody/one order" do
      campaign = Campaign.create! title: "foo", description: "bar"
      goody = Goody.create! title: "goody1", campaign: campaign
      goody.orders.create! payment_type: "stripe", quantity: 1, amount: 123
      expect(campaign.amount_raised).to eq(123)
    end

    it "works for multiple goodies/orders" do
      campaign = Campaign.create! title: "foo", description: "bar"
      goody1 = Goody.create! title: "goody1", campaign: campaign
      goody2 = Goody.create! title: "goody2", campaign: campaign
      goody3 = Goody.create! title: "goody3", campaign: campaign
      goody1.orders.create! payment_type: "stripe", quantity: 1, amount: 10
      # goody2 has no orders
      goody3.orders.create! payment_type: "stripe", quantity: 1, amount: 30
      goody3.orders.create! payment_type: "stripe", quantity: 1, amount: 40
      expect(campaign.amount_raised).to eq(80)
    end
  end

end
