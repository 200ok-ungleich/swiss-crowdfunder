require 'rails_helper'

describe 'admin dashboard', :type => :feature do
  it 'is secure' do
    visit admin_root_path
    expect(page).to have_content 'Login'
  end

  it 'cannot be accessed without a user' do
    visit admin_root_path
    fill_in 'E-Mail-Adresse', with: 'foo@bar.com'
    fill_in 'Passwort', with: 'nonsense'
    click_on 'Login'
    expect(page).to have_content 'not_found'
  end

  context 'Authenticated' do

    before :each do
      user = AdminUser.create! email: 'admin@example.com', password: '123123123', password_confirmation: '123123123'
      visit admin_root_path
      fill_in 'E-Mail-Adresse', with: 'admin@example.com'
      fill_in 'Passwort', with: '123123123'
      click_on 'Login'
    end

    it 'can be accessed with a user' do
      expect(page).to have_content 'Willkommen in Active Admin'
    end

    it 'shows all Campaigns' do
      FactoryBot.create :campaign, title: 'Spec Campaign'

      click_on 'Campaigns'
      expect(page).to have_content 'Spec Campaign'
    end

    it 'shows all Goodies' do
      FactoryBot.create :goody, title: 'Spec Goodie'

      click_on 'Goodies'
      expect(page).to have_content 'Spec Goodie'
    end

    it 'shows all Orders' do
      goody = FactoryBot.create :goody
      supporter = FactoryBot.build :supporter
      Order.create! goody: goody, payment_type: 'stripe', agreement: true, supporter: supporter

      click_on 'Orders'
      expect(page).to have_content 'stripe'
    end

    context 'Campaigns' do
      it 'can update campaigns' do
        campaign = FactoryBot.create :campaign, title: 'Spec Campaign'

        click_on 'Campaigns'
        click_on('Bearbeiten')
        fill_in 'campaign_title', with: 'some new title'
        click_on 'Campaign aktualisieren'
        expect(current_path).to eq(admin_campaign_path(campaign))
      end
    end

    context 'Goodies' do
      it 'can update goodies' do
        goody = FactoryBot.create :goody

        click_on 'Goodies'
        click_on('Bearbeiten')
        fill_in 'goody_title', with: 'some new title'
        click_on 'Goody aktualisieren'
        expect(current_path).to eq(admin_goody_path(goody))
        expect(goody.reload.title).to eq('some new title')
      end

      it 'can create goodies for non-active campaigns' do
       FactoryBot.create :campaign,
         title: 'Non-active campaign',
         active: false

       expect(Campaign.all.count).to eq(0)
       expect(Campaign.unscoped.count).to eq(1)
       expect(Goody.count).to eq(0)

       click_on 'Goodies'
       click_on 'Goody erstellen'
       select 'Non-active campaign', from: 'goody_campaign_id'
       fill_in 'goody_title', with: 'New goodie for non-active campaign'
       fill_in 'goody_price', with: '1000'
       fill_in 'goody_quantity', with: '1'
       click_on 'Goody anlegen'
       expect(current_path).to eq(admin_goody_path(Goody.first))
       expect(page).to have_content 'New goodie for non-active campaign'
       expect(Goody.count).to eq(1)
      end
    end

  end

end
