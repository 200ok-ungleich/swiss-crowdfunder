require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before :each do
    @campaign = FactoryBot.create :campaign
    @goody = FactoryBot.create :goody, campaign: @campaign
  end

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
     goody: @goody,
     payment_type: "stripe",
     agreement: true,
     supporter_attributes: FactoryBot.attributes_for(:supporter)
    }

  }

  let(:invalid_attributes) {
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MiceController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      order = Order.create! valid_attributes
      get :show, params: {id: order.to_param, campaign_id: @campaign.id, goody_id: @goody.id}
      expect(response).to be_success
    end
  end

end
