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
    expect(page).to have_content "unauthenticated"
  end
end
