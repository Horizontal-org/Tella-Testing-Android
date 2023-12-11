@smoke 
	Feature: Settings
	  
	Scenario: View Settings Categories
	Given the user is authenticated in the Tella application with valid credentials
	And is on the main page
	When they view the settings icon
	And click on it
	Then the user sees a list of categories with various configurations that can be performed