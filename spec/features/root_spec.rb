require 'rails_helper'

describe 'landing page', :type => :feature do
  it 'shows the landing page' do
    visit root_path
    expect(page).to have_content I18n.t('root.index.title')
  end
end

describe 'global errors', :type => :feature do

  it 'shows a 404 page' do
    visit '/certainly_not_a_valid_page'
    expect(page).to have_content I18n.t("errors.not_found.page_not_found_1")
  end

end
