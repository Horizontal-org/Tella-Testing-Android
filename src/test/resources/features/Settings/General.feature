  @smoke @General
	Feature: General
	
	Background: 
  Given the user is authenticated in the Tella application with valid credentials 654321
	And the user is in Tella home page
	
	Scenario: View Settings Categories
	When the user taps the settings icon
	Then the user sees a list of categories with various configurations that can be performed
	
	@Regression
	Scenario Outline: Change Language
  When the user taps the settings icon
  And taps the "General" option
  And taps the "Language" option in the general category
  And views the list with all available languages
  And clicks on the language <language>
  Then views the title <title> al the top of the page

  Examples: 
  |language    | title        |
  |Spanish     | Idioma       |
  |English     | Language     |
  |Arabic      | لغة          |
  |Belarusian  | мове         |
  |Persian     | زبان         |
  |French      | Langue       |
  |Indonesian  | Bahasa       |
  |Kachin      | Tsun Shaga Ga|
  |Kannada     | ಭಾಷೆ         |
  |Kurdish     | ziman        |
  |Malayalam   | ഭാഷ        | 
  |Burmese     | ဘာသာစကား   |
  |Portuguese  | Idioma       |
  |Russian     | язык         |
  |Tamil       |   மொழி    |
  |Default     |              |

  @Smoke
  Scenario: View General Category Configurations
  When the user taps the settings icon
  And presses the option "General"
  Then the user views a list with the general configurations of the app

  @smoke
  Scenario: Share Crash Reports
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated

  
  @smoke
  Scenario: Activate Verification Mode
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated

  @smoke
  Scenario: Access Recent Files
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
  
  @smoke
  Scenario: Access Favorite Forms
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated

  @smoke
  Scenario: Access Favorite Templates
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
 
  
  
  
  









