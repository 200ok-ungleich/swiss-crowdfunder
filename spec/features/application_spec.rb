require 'rails_helper'

describe "layout application", :type => :feature do
  # TMP Fix, as long as there's no root layout
  before :each do
    @campaign = FactoryBot.create :campaign
  end

  it "shows the about page" do
    #visit root_path
    visit campaign_path(@campaign)
    find('.qa-about-us a').click
    expect(page.status_code).to eq(200)
    expect(current_path).to eq(static_about_us_path)
  end

  it "shows the tos page" do
    #visit root_path
    visit campaign_path(@campaign)
    find('.qa-terms-of-service a').click
    expect(page.status_code).to eq(200)
    expect(current_path).to eq(static_terms_of_service_path)
  end

  it 'has an endpoint dedicated to testing failure' do
    basic_auth('letme', 'in')
    expect do
      visit static_exception_test_path
    end.to raise_error(RuntimeError)
  end

  describe 'go live' do
    it 'before go live' do
      new_time = Time.local(2017, 11, 11, 18, 0, 0)
      Timecop.freeze(new_time)
      visit root_path
      expect(current_path).to eq(static_countdown_path)
      Timecop.return
    end
  end


end
