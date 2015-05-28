Feature: login
	Logging in

@api
Scenario: Local log in
	Given I am logged in as a user with the "authenticated user" role
	Then I should see "edit" in the "Body" region

@api
Scenario: CAS log in
	Given I am on "/user"
	When I press "edit-submit"
	And I fill in "username" and "password" with CAS credentials
	And I press "signinbutton"
	Then I should see "edit" in the "Body" region
