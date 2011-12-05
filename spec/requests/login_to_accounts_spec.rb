require 'spec_helper'

describe "LoginToAccounts" do
  before do
    other_account = Factory.create(:account)
    @invalid_user = Factory.create(:user, account: other_account)
    @account = Factory.create(:account, subdomain: "test-account")
    @user = Factory.create(:user, account: @account)
    Capybara.app_host = "http://test-account.example.com"
    visit '/'
  end

  describe "log in to a valid account" do
    before do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
    end

    it "will notify me that I have logged in successfully" do
      page.should have_content "Signed in successfully"
    end
  end

  describe "fail login for valid user wrong account" do
    before do
      fill_in 'Email', with: @invalid_user.email
      fill_in 'Password', with: @invalid_user.password
      click_button 'Sign in'
    end

    it "will notify me that I have logged in successfully" do
      page.should_not have_content "Signed in successfully"
    end
  end
end
