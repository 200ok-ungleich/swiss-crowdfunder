require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before :each do
    @campaign = Campaign.create! title: 'Data Center Light',
      claim: 'The best hosting in the world',
                                 description: "It's the best",
                                 start_date: 10.days.from_now,
                                 end_date: 40.days.from_now,
                                 youtube_url: 'https://www.youtube.com/watch?v=ZUgjm-XqKuc',
                                 goal: 1000
    @goody = Goody.create campaign: @campaign,
                          title: 'Super Stickers'
  end

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
     goody: @goody,
     payment_type: "stripe",
     agreement: true
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


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, params: {order: valid_attributes.merge(campaign_id: @campaign.id, goody_id: @goody.id)}
        }.to change(Order, :count).by(1)
      end

      #it "redirects to the created order" do
      #  post :create, params: {order: valid_attributes}, session: valid_session
      #  expect(response).to redirect_to(Order.last)
      #end
    end

    #context "with invalid params" do
    #  it "returns a success response (i.e. to display the 'new' template)" do
    #    post :create, params: {order: invalid_attributes}, session: valid_session
    #    expect(response).to be_success
    #  end
    #end
  end

end
