  Feature: Servers
    
  @smoke
  Scenario: View Settings in the Server Category
  Given the user is authenticated in the Tella application with valid credentials
  And is on the main page
  And they view the settings icon
  And click on it
  When the user sees a list of categories with various configurations that can be performed
  And selects the option "Servers"
  Then the user views the server configurations
  
  @smoke
  Scenario: View Server Options
  Given the user is authenticated in the Tella application with valid credentials
  And is on the main page
  And they view the settings icon
  And click on it
  And the user sees a list of categories with various configurations that can be performed
  And selects the option "Servers"
  When the user views the server configurations
  And presses the "Add" icon
  Then they should see all possible server options available for connection