require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "ResearchAide"
    assert_equal full_title("Help"), "Help | ResearchAide"
    assert_equal full_title("About"), "About | ResearchAide"
    assert_equal full_title("Contact"), "Contact | ResearchAide"
    
  end
end