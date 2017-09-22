require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe "Amount raised" do
    it "works for zero orders" do
      campaign = Campaign.create! title: "foo", description: "bar"
      goodie = Goodie.create! title: "goodie1", campaign: campaign
      expect(campaign.amount_raised).to eq(0)
    end

    it "works for one goodie/one order" do
      campaign = Campaign.create! title: "foo", description: "bar"
      goodie = Goodie.create! title: "goodie1", campaign: campaign
      goodie.orders.create! payment_type: "stripe", quantity: 1, amount: 123
      expect(campaign.amount_raised).to eq(123)
    end

    it "works for multiple goodies/orders" do
      campaign = Campaign.create! title: "foo", description: "bar"
      goodie1 = Goodie.create! title: "goodie1", campaign: campaign
      goodie2 = Goodie.create! title: "goodie2", campaign: campaign
      goodie3 = Goodie.create! title: "goodie3", campaign: campaign
      goodie1.orders.create! payment_type: "stripe", quantity: 1, amount: 10
      # goodie2 has no orders
      goodie3.orders.create! payment_type: "stripe", quantity: 1, amount: 30
      goodie3.orders.create! payment_type: "stripe", quantity: 1, amount: 40
      expect(campaign.amount_raised).to eq(80)
    end
  end

end
