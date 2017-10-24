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
      FactoryBot.create :campaign

      click_on "Campaigns"
      expect(page).to have_content "Spec Campaign"
    end

    it "shows all Goodies" do
      FactoryBot.create :goody, title: "Spec Goodie"

      click_on "Goodies"
      expect(page).to have_content "Spec Goodie"
    end

    it "shows all Orders" do
      goody = FactoryBot.create :goody
      supporter = FactoryBot.build :supporter
      Order.create! goody: goody, payment_type: "stripe", agreement: true, supporter: supporter

      click_on "Orders"
      expect(page).to have_content "stripe"
    end
  end

end
