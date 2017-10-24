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
     agreement: true,
     supporter_attributes: { first_name: "John", last_name: "Doe", date_of_birth: 18.years.ago }
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
