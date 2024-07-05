@General
Feature: General

  Background:
    Given the user is in Tella home page


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


  @Smoke
  Scenario: Share Crash Reports
    When the user taps the settings icon
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated


  @Smoke
  Scenario: Activate Verification Mode
    When the user taps the settings icon
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated


  @Smoke
  Scenario: Access Recent Files
    When the user taps the settings icon
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated

  @Smoke
  Scenario: Access Favorite Forms
    When the user taps the settings icon
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated

  @Smoke
  Scenario: Access Favorite Templates
    When the user taps the settings icon
    And taps on it to enable
    Then the user sees that the color has changed to green, indicating it is activated














