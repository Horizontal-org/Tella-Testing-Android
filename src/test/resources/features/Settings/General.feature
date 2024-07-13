@General @Regression
Feature: General

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon

  @Automated @test
  Scenario Outline: View Settings Categories
    When clicks on the category <category>
    Then the user access the category <category>

    Examples:
      | category     |
      | General      |
      | Security     |
      | Servers      |
      | About & Help |
      | Feedback     |

  @ChangeLanguage @Automated
  Scenario Outline: Change Language
    When taps the general option
    And taps the language option in the general category
    And views the list with all available languages
    And clicks on the language <language>
    Then views the title <title> at the top of the page

    Examples:
      | language   | title         |
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


  @Smoke @Automated
  Scenario: View General Category Configurations
    When taps the general option
    Then the user should view a list with the general configurations of the app


  @Smoke
  Scenario: Share Crash Reports
    When the user taps the settings icon
    And taps the general option
    And taps on Share Crash Reports to enable
    Then the user sees that the color has changed to green, indicating it is activated


  @Smoke
  Scenario: Activate Verification Mode
    When the user taps the settings icon
    And taps the general option
    And taps on Verification Mode to enable
    Then the user sees that the color has changed to green, indicating it is activated


  @Smoke
  Scenario: Access Recent Files
    When the user taps the settings icon
    And taps the general option
    And taps on Recent Files to enable
    Then the user sees that the color has changed to green, indicating it is activated

  @Smoke
  Scenario: Access Favorite Forms
    When the user taps the settings icon
    And taps the general option
    And taps on Favorite Forms to enable
    Then the user sees that the color has changed to green, indicating it is activated

  @Smoke
  Scenario: Access Favorite Templates
    When the user taps the settings icon
    And taps the general option
    And taps on Favorite Templates to enable
    Then the user sees that the color has changed to green, indicating it is activated


  @Smoke @Automated
  Scenario Outline: Activate configuration <configuration>
    When taps the general option
    And switch configuration <configuration> to enable
    Then the user sees that the color has changed to green, indicating it is activated

    Examples:
      | configuration       |
      | Share Crash Reports |
      | Verification Mode   |
      | Verification Mode   |
      | Recent Files        |
      | Favorite Forms      |
      | Favorite Templates  |














