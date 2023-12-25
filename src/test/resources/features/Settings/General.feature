<<<<<<< HEAD
Feature: General

  Background:
    Given the user is authenticated in the Tella application with valid credentials "654321"
    And is on the main page

  @Ignore
  Scenario: View Settings Categories
  When they view the settings icon
  And click on it
  Then the user sees a list of categories with various configurations that can be performed
	
  @Regression @ChangeLanguage @Automated
  Scenario Outline: Change Language
    When the user taps the settings icon
    And taps the general option
    And taps the language option in the general category
    And views the list with all available languages
    And clicks on the language <language>
    Then views the title <title> at the top of the page

    Examples:
      | language   | title         |
      | Default    | Language      |
      | Arabic     | اللغة         |
      | Belarusian | Мова          |
      | English    | Language      |
      | Spanish    | Idioma        |
      | Persian    | زبان          |
      | French     | Langue        |
      | Indonesian | Bahasa        |
      | Kachin     | Tsun Shaga Ga |
      | Kannada    | ಭಾಷೆ          |
      | Kurdish    | زمان          |
      | Malayalam  | ഭാഷ           |
      | Burmese    | ဘာသာစကား      |
      | Portuguese | Idioma        |
      | Russian    | Язык          |
      | Tamil      | மொழி         |


  @Smoke
  Scenario: View General Category Configurations
    And they view the settings icon
    And click on it settings icon
    When the user sees a list of categories with various configurations that can be performed
    And presses the option "General"
    Then the user should view a list with the general configurations of the app
=======
  @General
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
>>>>>>> 1167d2498f71358bef1743465585b549e01258ac

  @Smoke
  Scenario: Share Crash Reports
<<<<<<< HEAD
    When the user taps the settings icon
    And views the "Share crash reports" option
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated
    And from that moment, crash reports should be automatically sent

  @smoke
  Scenario: Activate Verification Mode
    When the user taps the settings icon
    And views the "Verification mode" option
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated
    And from that moment, files should be verifiable
=======
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated

  
  @Smoke
  Scenario: Activate Verification Mode
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
>>>>>>> 1167d2498f71358bef1743465585b549e01258ac

  @Smoke
  Scenario: Access Recent Files
<<<<<<< HEAD
    When the user taps the settings icon
    And views the "Recent files" option
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated
    And should be able to access their recent files

  @smoke
  Scenario: Access Favorite Forms
    When the user taps the settings icon
    And views the "Favorite forms" option
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated
    And should have quick access to favorite forms
=======
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
  
  @Smoke
  Scenario: Access Favorite Forms
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
>>>>>>> 1167d2498f71358bef1743465585b549e01258ac

  @Smoke
  Scenario: Access Favorite Templates
<<<<<<< HEAD
    When the user taps the settings icon
    And views the "Favorite templates" option
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated
    And should have direct access to favorite templates
=======
  When the user taps the settings icon
  And taps on it to enable
  Then the user sees that the color has changed to green, indicating it is activated
 
>>>>>>> 1167d2498f71358bef1743465585b549e01258ac
  
  
  
  









