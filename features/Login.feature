Feature: Login page

    As a user
    So that I can log into my account
    I want to log into my profile page

    Scenario: log into an account
    	Given I’m on Login page
    	When I try to log in
    	Then I should be able to log into my profile page

    Scenario: log into an account without correct email and password
    	Given I’m on Login page
    	When I try to log in without correct email and password
    	Then I should be able to see an error message “Invalid Email/password combination”

    Scenario: a new user without an account
    	Given I’m on Login page
    	When I am a new user and click on link “Sign up now”    	
	    Then I should be able to goto sign up page