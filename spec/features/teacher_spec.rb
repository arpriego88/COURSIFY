require 'rails_helper'

RSpec.feature "Teacher management", :type => :feature do
  scenario "Teachers have access to a lot" do
    @user = FactoryGirl.create(:user)
    @user.name = 'Mr.Test'
    @user.email = 'teachertest@test.com'
    @user.password = 'password'
    @user.role = 1
    @user.save
    visit "/users/sign_in"
    fill_in 'user_email', :with => 'teachertest@test.com'
    fill_in 'user_password', :with => 'password'
    click_button 'Log in'
    visit '/courses/new'
    click_link 'Who We Are'
    expect(page.body).to have_text('Benjamin Franklin')
    click_link 'Contact'
    expect(page.body).to have_text('Drop')
    @course = FactoryGirl.create(:course)
    @course[:teacher_id] = @user.id
    @course.save
    @lesson = FactoryGirl.create(:lesson)
    @lesson[:course_id] = @course.id
    @lesson.save
    click_link 'Mr.Test'
    click_link 'Edit'
    click_button 'Save Changes'
    click_link 'Mr.Test'
    click_link 'Delete'
  end
end