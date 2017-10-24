require 'rails_helper'

describe 'campaigns' do

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

  scenario 'campaigns#show' do
    visit campaign_path(@campaign)
    expect(page).to have_content "It's the best"
  end

  scenario 'navigation to the goodies' do
    visit campaign_path(@campaign)
    find('.qa-support-project').click
    expect(page).to have_content 'Super Stickers'
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

        fill_in "First name", with: "John"
        fill_in "Last name", with: "Doe"
        select "1950", from: "order_supporter_attributes_date_of_birth_1i"
        find('.qa-agreement').click
        find('.qa-submit').click
        expect(page).to_not have_content I18n.t('errors.messages.blank')
      end.to change{Order.count}.from(0).to(1)
    end
  end
end
