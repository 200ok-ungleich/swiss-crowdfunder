require 'rails_helper'

describe 'campaigns' do

  before :each do
    @campaign = FactoryBot.create :campaign, title: 'Spec Campaign'
    @goody = FactoryBot.create :goody, title: 'Spec Goody', campaign: @campaign
  end

  scenario 'campaigns#show' do
    visit campaign_path(@campaign)
    expect(page).to have_content 'Spec Campaign'
  end

  scenario 'navigation to the goodies' do
    visit campaign_path(@campaign)
    find('.qa-support-project').click
    expect(page).to have_content 'Spec Goody'
  end

  feature 'buying goodies' do

    scenario 'confirmation page' do
      visit campaign_goodies_path([@campaign, @goody])
      find('.qa-pledge').click
      expect(page).to have_content I18n.t('orders.new.confirmation')
    end

    scenario 'not without a agreement' do
      visit campaign_goodies_path([@campaign, @goody])
      find('.qa-pledge').click
      find('.qa-submit').click
      expect(page).to have_content I18n.t('errors.messages.blank')
    end

    scenario 'not without nested supporter info' do
      visit campaign_goodies_path([@campaign, @goody])
      find('.qa-pledge').click
      find('.qa-agreement').click
      find('.qa-submit').click
      expect(page).to have_content I18n.t('errors.messages.blank')
    end

    scenario 'with agreement and all fields filled out' do
      expect do
        visit campaign_goodies_path([@campaign, @goody])
        find('.qa-pledge').click

        fill_in I18n.t('orders.new.first_name'), with: "John"
        fill_in I18n.t('orders.new.last_name'), with: "Doe"
        fill_in I18n.t('orders.new.email'), with: "supporter@example.com"
        select "1950", from: "order_supporter_attributes_date_of_birth_1i"
        find('.qa-agreement').click
        find('.qa-submit').click
        expect(page).to_not have_content I18n.t('errors.messages.blank')
      end.to change{Order.count}.from(0).to(1)
    end
  end
end
