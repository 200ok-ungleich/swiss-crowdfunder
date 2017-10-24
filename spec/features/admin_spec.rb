require 'rails_helper'

describe "admin dashboard", :type => :feature do
  it "is secure" do
    visit admin_root_path
    expect(page).to have_content "Login"
  end

  it "cannot be accessed without a user" do
    visit admin_root_path
    fill_in "E-Mail-Adresse", with: "foo@bar.com"
    fill_in "Passwort", with: "nonsense"
    click_on "Login"
    expect(page).to have_content "not_found"
  end

  context "Authenticated" do

    before :each do
      user = AdminUser.create! email: "admin@example.com", password: "123123123", password_confirmation: "123123123"
      visit admin_root_path
      fill_in "E-Mail-Adresse", with: "admin@example.com"
      fill_in "Passwort", with: "123123123"
      click_on "Login"
    end

    it "can be accessed with a user" do
      expect(page).to have_content "Willkommen in Active Admin"
    end

    it "shows all Campaigns" do
      Campaign.create! title: 'Data Center Light',
        claim: 'The best hosting in the world',
        description: "It's the best",
        start_date: 10.days.from_now,
        end_date: 40.days.from_now,
        youtube_url: 'https://www.youtube.com/watch?v=ZUgjm-XqKuc',
        goal: 1000

      click_on "Campaigns"
      expect(page).to have_content "Data Center Light"
    end

    it "shows all Goodies" do
      campaign = Campaign.create! title: 'Data Center Light',
        claim: 'The best hosting in the world',
        description: "It's the best",
        start_date: 10.days.from_now,
        end_date: 40.days.from_now,
        youtube_url: 'https://www.youtube.com/watch?v=ZUgjm-XqKuc',
        goal: 1000
      Goody.create campaign: campaign,
        title: 'Super Stickers'

      click_on "Goodies"
      expect(page).to have_content "Super Stickers"
    end

    it "shows all Goodies" do
      campaign = Campaign.create! title: 'Data Center Light',
        claim: 'The best hosting in the world',
        description: "It's the best",
        start_date: 10.days.from_now,
        end_date: 40.days.from_now,
        youtube_url: 'https://www.youtube.com/watch?v=ZUgjm-XqKuc',
        goal: 1000
      goody = Goody.create campaign: campaign,
        title: 'Super Stickers'
      supporter = Supporter.new first_name: "John", last_name: "Doe", date_of_birth: 18.years.ago
      Order.create! goody: goody, payment_type: "stripe", agreement: true, supporter: supporter

      click_on "Orders"
      expect(page).to have_content "Super Stickers"
    end

  end


end
