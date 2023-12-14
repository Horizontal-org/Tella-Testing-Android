  @smoke 
	Feature: General
	
	Background: 
  Given the user is authenticated in the Tella application with valid credentials 654321
	And is on the main page
	
	Scenario: View Settings Categories
  When they view the settings icon
	And click on it
	Then the user sees a list of categories with various configurations that can be performed
	
	@Reresion
	Scenario Outline: Change Language
  When the user taps the settings icon
  And taps the "General" option
  And taps the "Language" option in the general category
  And views the list with all available languages
  And clicks on the language <language>
  Then views the same list with the language chosen in the previous step

  Examples: 
  |language    |
  |Spanish     |
  |English     |
  |Arabic      |
  |Belarusian  |
  |Persian     |
  |French      |
  |Indonesian  |
  |Kachin      |
  |Kannada     |
  |Kurdish     |
  |Malayalam   |
  |Burmese     |
  |Portuguese  |
  |Russian     |
  |Tamil       |
  |Default     |

  @Smoke
  Scenario: View General Category Configurations
  And they view the settings icon
  And click on it
  When the user sees a list of categories with various configurations that can be performed
  And presses the option "General"
  Then the user should view a list with the general configurations of the app

  @smoke
  Scenario: Share Crash Reports
  When the user taps the settings icon
  And views the "Share crash reports" option
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
  And from that moment, crash reports should be automatically sent
  




