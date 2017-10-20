require 'rails_helper'

describe "layout application", :type => :feature do
  it "shows the about page" do
    visit root_path
    find('.qa-about-us a').click
    expect(page.status_code).to eq(200)
    expect(current_path).to eq(static_about_us_path)
  end

  it "shows the tos page" do
    visit root_path
    find('.qa-terms-of-service a').click
    expect(page.status_code).to eq(200)
    expect(current_path).to eq(static_terms_of_service_path)
  end

end
