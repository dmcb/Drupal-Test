Feature: login
	Logging in

@api
Scenario: Local log in
	Given I am logged in as a user with the "authenticated user" role
	Then I should see "edit" in the "Body" region

@api
Scenario: CAS log in
	Given I am on "/user"
	When I log in via CAS
	Then I should see "edit" in the "Body" region