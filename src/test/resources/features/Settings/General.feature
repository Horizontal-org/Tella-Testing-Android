@General @Regression @Settings

Feature: General

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon

  @Smoke @Automated
  Scenario Outline: View Settings Categories
    When clicks on the category <category>
    Then the user access the category <visible>

    Examples:
      | category     | visible      |
      | General      | General      |
      | Security     | Security     |
      | Servers      | Connections  |
      | About & Help | About & Help |
      | Feedback     | Feedback     |

  @Smoke @ChangeLanguage @Automated
  Scenario Outline: Change Language
    When taps the general button
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
      | Vietnamese | Ngôn ngữ      |
      | Bangla     | বাংলা         |


  @Smoke @Automated
  Scenario: View General Category Configurations
    When taps the general button
    Then the user should view a list with the general configurations of the app

  @Smoke @Automated
  Scenario Outline: Activate configuration <configuration>
    When taps the general button
    And switch configuration <configuration> to enable
    Then the user sees that the color has changed to green, indicating it is activated <configuration>

    Examples:
      | configuration       |
      | Share crash reports |
      | Verification mode   |
      | Recent files        |
      | Favorite forms      |
      | Favorite templates  |














