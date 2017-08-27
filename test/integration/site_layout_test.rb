require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "layout links" do
    #Arrive at homepage
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", users_path, count: 0
    #Go to log in page
    get login_path
    assert_template 'sessions/new'
    assert_select "a[href=?]", signup_path
    #Admin log in
    log_in_as(@non_admin)
    follow_redirect!
    #User landing page
    assert_template 'users/show'
    assert_select "a[href=?]", signup_path, count: 0
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@non_admin)
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", edit_user_path(@non_admin)
  end
end
