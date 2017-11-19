require 'rails_helper'

describe 'landing page', :type => :feature do
  it 'shows the landing page' do
    visit root_path
    expect(page).to have_content "Swiss Crowdfunder"
  end

  it 'shows active campaigns' do
    FactoryBot.create :campaign, title: "Spec 1 Campaign", active: true
    FactoryBot.create :campaign, title: "Spec 2 Campaign", active: false

    visit root_path
    expect(page).to have_content "Spec 1 Campaign"
    expect(page).to_not have_content "Spec 2 Campaign"
  end

end

describe 'global errors', :type => :feature do

  it 'shows a 404 page for unknown URLs' do
    visit '/certainly_not_a_valid_page'
    expect(page).to have_content I18n.t("errors.not_found.page_not_found_1")
  end

  it 'shows a 404 page for unknown entities' do
    visit '/campaigns/123123123'
    expect(page).to have_content I18n.t("errors.not_found.page_not_found_1")
  end

end
