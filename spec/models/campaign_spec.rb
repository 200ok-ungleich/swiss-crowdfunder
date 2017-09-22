require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe "Amount raised" do
    it "works for zero orders" do
      campaign = Campaign.create! title: "foo"
      goodie = Goodie.create! title: "goodie1", campaign: campaign
      expect(campaign.amount_raised).to eq(0)
    end

    it "works for one goodie/one order" do
      campaign = Campaign.create! title: "foo"
      goodie = Goodie.create! title: "goodie1", campaign: campaign
      goodie.orders.create! payment_type: "stripe", quantity: 1, amount: 123
      expect(campaign.amount_raised).to eq(123)
    end
  end

end
