require 'rails_helper'

describe "the signin process", :type => :feature do
  it "shows the landing page" do
    visit root_path
    expect(page).to have_content I18n.t('root.index.title')
  end
end
