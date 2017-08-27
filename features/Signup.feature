Feature: Signup page

    As a user
    So that I can create a new account
    I want to add all information to the account

    Scenario: Create an account
    	Given I’m on the Signup page
    	When I try to signup
    	Then I should be able to see message “Please check your email to activate your account”

    Scenario: Create an account without name
    	Given I’m on the Signup page
    	When I try to sign up without name
    	Then I should be able to see an error message “Name can’t be blank”

    Scenario: Create an account without email
    	Given I’m on the Signup page
    	When I try to sign up without email
    	Then I should be able to see an error message “Email can’t be blank”

    Scenario: Create an account without valid email
    	Given I’m on the Signup page
    	When I try to sign up without valid email
    	Then I should be able to see an error message “Email is invalid”

    Scenario: Create an account without password
    	Given I’m on the Signup page
    	When I try to sign up without password
    	Then I should be able to see an error message “Password can’t be blank”

    Scenario: Create an account without correct password confirmation
    	Given I’m on the Signup page
    	When I try to sign up without correct password confirmation
    	Then I should be able to see an error message “Password confirmation doesn’t match Password”