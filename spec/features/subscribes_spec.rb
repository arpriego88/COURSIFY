#feature spec
require 'rails_helper'

RSpec.feature "Subscription management", :type => :feature do
  scenario "User subscribes to course" do
    @course = FactoryGirl.create(:course)
    sign_in
    visit "/courses"
    expect(page.body).to have_text("Test Course")
    expect(page.body).to have_text("Subscribe")
    click_link 'Subscribe'
    expect(page.body).to have_text("unsubscribe")
  end
end