Feature: login
	Logging in

Background:
	Given I am logged in as a user with the "site admin" role

@api
Scenario: Edit Node
	Given I am viewing a "page" node with the title "Cool beans!"
	When I click "Edit" in the "Body" region
	And I fill in the following:
		|Body |Ipsumm |
	And I press "Save"
	Then I should see "Ipsumm" in the "Body" region