
#test 6 senarios for sign up page
Given(/^I’m on the Signup page$/)do
  visit(signup_path)
end

When(/^I try to signup$/)do
  fill_in 'user_name', :with => "filex"
  fill_in 'user_email', :with => "filex@seas.upenn.edu"
  fill_in 'user_password', :with => "Fall2015"
  fill_in 'user_password_confirmation', :with => "Fall2015"
  click_button 'Create my account'
end

Then(/I should be able to see message “Please check your email to activate your account”$/) do
  assert page.has_content? ("Please check your email to activate your account")
end

When(/^I try to sign up without name$/)do
  fill_in 'user_email', :with => "wangn@seas.upenn.edu"
  fill_in 'user_password', :with => "Fall2015"
  fill_in 'user_password_confirmation', :with => "Fall2015"
  click_button 'Create my account'
end

Then(/I should be able to see an error message “Name can’t be blank”$/) do
  assert page.has_content? ("Name can't be blank")
end

When(/^I try to sign up without email$/)do
  fill_in 'user_name', :with => "wangn"
  #fill_in 'user_email', :with => "wangn@seas.upenn.edu"
  fill_in 'user_password', :with => "Fall2015"
  fill_in 'user_password_confirmation', :with => "Fall2015"
  click_button 'Create my account'
end

Then(/I should be able to see an error message “Email can’t be blank”$/) do
  assert page.has_content? ("Email can't be blank")
end

When(/^I try to sign up without valid email$/)do
  fill_in 'user_name', :with => "wangn"
  fill_in 'user_email', :with => "hehe"
  fill_in 'user_password', :with => "Fall2015"
  fill_in 'user_password_confirmation', :with => "Fall2015"
  click_button 'Create my account'
end

Then(/I should be able to see an error message “Email is invalid”$/) do
  assert page.has_content? ("Email is invalid")
end

When(/^I try to sign up without password$/)do
  fill_in 'user_name', :with => "wangn"
  fill_in 'user_email', :with => "wangn@seas.upenn.edu"
  #fill_in 'user_password', :with => "Fall2015"
  fill_in 'user_password_confirmation', :with => "Fall2015"
  click_button 'Create my account'
end

Then(/I should be able to see an error message “Password can’t be blank”$/) do
  assert page.has_content? ("Password can't be blank")
end

When(/^I try to sign up without correct password confirmation$/)do
  fill_in 'user_name', :with => "wangn"
  fill_in 'user_email', :with => "wangn@seas.upenn.edu"
  fill_in 'user_password', :with => "Fall2015"
  fill_in 'user_password_confirmation', :with => "hehe-Fall2015"
  click_button 'Create my account'
end

Then(/I should be able to see an error message “Password confirmation doesn’t match Password”$/) do
  assert page.has_content? ("Password confirmation doesn't match Password")
end




#test 3 senarios for log in page
Given(/^I’m on Login page$/)do
  visit(login_path)
end

When(/^I try to log in$/)do
  fill_in 'session_email', :with => "wangn@seas.upenn.edu"
  fill_in 'session_password', :with => "123456"
  click_button 'Log in'
end

Then(/I should be able to log into my profile page$/) do
  assert (page.has_content?(" following "))
end

When(/^I try to log in without correct email and password$/)do
  fill_in 'session_email', :with => "maolijun@seas.upenn.edu"
  fill_in 'session_password', :with => "123456"
  click_button 'Log in'
end

Then(/I should be able to see an error message “Invalid Email\/password combination”$/) do
  assert page.has_content? ("Invalid email/password combination")
end

When(/^I am a new user and click on link “Sign up now”$/)do
  #fill_in 'session_email', :with => "maolijun@seas.upenn.edu"
  #fill_in 'session_password', :with => "123456"
  visit(signup_path)
end

Then(/I should be able to goto sign up page$/) do
  assert page.has_content? ("Sign up")
end