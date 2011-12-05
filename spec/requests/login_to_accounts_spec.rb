require 'spec_helper'

describe "LoginToAccounts" do
  describe "log in to a valid account" do
    before do
      @account = Factory.create(:account, subdomain: "test-account")
      @user = Factory.create(:user, account: @account)
      Capybara.app_host = "http://test-account.example.com"
      visit '/'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
    end

    it "will notify me that I have logged in successfully" do
      page.should have_content "Signed in successfully"
    end
  end
end
