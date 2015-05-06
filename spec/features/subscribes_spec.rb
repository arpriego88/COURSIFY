#feature spec
require 'rails_helper'

RSpec.feature "Subscription management", :type => :feature do
  scenario "User subscribes to course and can take a quiz" do
    @course = FactoryGirl.create(:course)
    @lesson = FactoryGirl.create(:lesson)
    @lesson[:course_id] = @course.id
    @lesson.save 
    sign_in
    visit "/courses"
    expect(page.body).to have_text("Test Course")
    expect(page.body).to have_text("Subscribe")
    click_link 'Subscribe'
    click_link 'Test Course'
    expect(page.body).to have_text('This is my test description')
    click_link 'Test lesson'
    click_link 'Take Quiz'
  end
end