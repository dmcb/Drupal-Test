Feature: login
	Logging in

@api
Scenario: Local log in
	Given I am logged in as a user with the "authenticated user" role
	Then I should see "edit" in the "Body" region

@api
Scenario: Good CAS log in
	Given I am on "/user"
	When I press "edit-submit"
	And I fill in "username" and "password" with CAS credentials
	And I press "Sign In"
	And I click "here"
	Then I should see "Logged in via UofC Access"

@api
Scenario: Bad CAS log in
	Given I am on "/user"
	When I press "edit-submit"
	And I fill in "username" and "password" with CAS credentials
	And I fill in "password" with "thisisnotthecorrectpassword"
	And I press "Sign In"
	Then I should see "Sorry, you entered an invalid EID or password"