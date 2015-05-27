Feature: login
	Logging in

@api
Scenario: Log in
	Given I am logged in as a user with the "administrator" role
	And I am viewing a "Photo article" with the title "LOL!"
	When I click "Edit" in the "Body" region
	And I fill in the following:
		|Body |Ipsumm |
	And I press "Save"
	Then I should see "Ipsumm" in the "Body" region