@General @Regression @Settings
Feature: General

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon

  @Smoke @Automated @Flow
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

  @ChangeLanguage @ToBeAutomated
  Scenario: Change Language and Re-change by default language
    When taps the general button
    And taps the language option in the general category
    And views the list with all available languages
    And clicks on the language "Arabic"
    And views the title <title> at the top of the page
    And the option to select the default language is visible
    And clicks on the language "Default"
    Then the user will see the same language applied as the device

  @Smoke @ChangeLanguage @ToBeAutomated @E2E
  Scenario Outline: Change Language
    When taps the general button
    And taps the language option in the general category
    And views the list with all available languages
    And clicks on the language <language>
    And views the title <title> at the top of the page
    And the user is in Tella home page
    Then the user will see the language applied

    Examples:
      | language               | title                  |
      | Arabic                 | اللغة                  |
      | Belarusian             | Мова                   |
      | English                | Language               |
      | Spanish                | Idioma                 |
      | Persian                | زبان                   |
      | French                 | Langue                 |
      | Indonesian             | Bahasa                 |
      | Kachin                 | Tsun Shaga Ga          |
      | Kannada                | ಭಾಷೆ                   |
      | Kurdish                | زمان                   |
      | Malayalam              | ഭാഷ                    |
      | Burmese                | ဘာသာစကား               |
      | Shona(Zimbabwe)        | ChiShona(Zimbabwe)     |
      | Portuguese             | Idioma                 |
      | Russian                | Язык                   |
      | Tamil                  | மொழி                  |
      | Vietnamese             | Ngôn ngữ               |
      | Bangla                 | বাংলা                  |
      | Portuguese(Mozambique) | Portuguese(Mozambique) |
      | Tsonga                 | Tsonga                 |

  @Smoke @Automated @Flow
  Scenario Outline: Activate configuration <configuration>
    When taps the general button
    And switch configuration <configuration> to enable
    Then the user sees that the color has changed to green, indicating it is activated <configuration>

    Examples:
      | configuration               |
      | Share data to improve tella |
      | Share crash reports         |
      | Verification mode           |
      | Recent files                |
      | Favorite forms              |
      | Favorite templates          |
      | Text Justification          |
      | Incresease text spacing     |

  @Smoke @ToBeAutomated @E2E
  Scenario: Activate configuration Share data to improve tella
    And taps the general button
    When switch configuration "Share data to improve tella" to enable
    Then and approval message is displayed

 @Smoke @ToBeAutomated @E2E
  Scenario Outline: Activate configuration <configuration>
    And the user has files in tella
    And the user has server conecctions in tella
    And the user has templates in tella
    And taps the general button
    And switch configuration <configuration> to enable
    When the user is back into Tella home page
    Then the user will be able to view the configuration <configuration> in the home page
    Examples:
      | configuration      |
      | Recent files       |
      | Favorite forms     |
      | Favorite templates |

  @SmokeManual @E2E #oki posible automatizacion
  Scenario Outline: Activate configuration <configuration>
    And taps the general button
    And switch configuration <configuration> to enable
    When a sign is displayed that tella will be refreshed to apply changes
    And taps the general button
    Then the user will be able to view the changes applied by the configuration <configuration>

    Examples:
      | configuration           |
      | Text Justification      |
      | Incresease text spacing |