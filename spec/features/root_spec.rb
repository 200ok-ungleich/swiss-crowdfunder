require 'rails_helper'

describe 'landing page', :type => :feature do
  pending 'shows the landing page' do
    visit root_path
    expect(page).to have_content I18n.t('root.index.title')
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
