@General @Regression @Settings
Feature: General

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon

  @Smoke @Automated @Flow
  Scenario Outline: View Settings Categories
    When the user taps the category <category>
    Then the user accesses the category <visible>

    Examples:
      | category     | visible      |
      | General      | General      |
      | Security     | Security     |
      | Servers      | Connections  |
      | About & Help | About & Help |
      | Feedback     | Feedback     |

  @ChangeLanguage @Candidate
  Scenario Outline: Change Language and Re-change by default language
    When the user taps the "General" button
    And the user taps the "Language" option
    And the user views the list with all available languages
    And the user taps on the language <language>
    And the user views the title <title> at the top of the page
    And the option to select the default language is visible
    And the user taps on <Default> 
    Then the user will see the same language applied as the device
    
    Examples:
    | language        | title      |   Default           |
    | French          | Langue     |  Valeur par défaut  |
    | Spanish         |  Idioma    |  Predeterminado     |
    
  @Smoke @ChangeLanguage @Candidate @E2E
  Scenario Outline: Change Language
    When the user taps the "General" button
    And the user taps the "Language" option 
    And the user views the list with all available languages
    And the user taps on the language <language>
    And the user views the title <title> at the top of the page
    And the user is in Tella home page
    Then the user will see the language applied

    Examples:
      | language               | title                  |
      | Arabic                 | اللغة                     |
      | Azerbaijani            | Dil                  |
      | Belarusian             | Мова                   |
      | English                | Language               |
      | Spanish                | Idioma                 |
      | Persian                | زبان                   |
      | French                 | Langue                 |
      | Indonesian             | Bahasa                 |
      | Kachin                 | Tsun Shaga Ga          |
      | Kannada                | ಭಾಷೆ                   |
      | Kurdish                | زمان                     |
      | Mizo                   | Tawng                  |
      | Malayalam              | ഭാഷ                    |
      | Burmese                | ဘာသာစကား               |
      | Shona(Zimbabwe)        | Ndhimu                 |
      | Portuguese             | Idioma                 |
      | Russian                | Язык                   |
      | Tamil                  | மொழி                  |
      | Vietnamese             | Ngôn ngữ               |
      | Bangla                 | বাংলা                  |
      | Portuguese(Mozambique) | Língua                |
      | Tsonga                 | Lirimi                |
      | Chinese (China)        | 语言                   |

  @Smoke @Automated @Flow
  Scenario Outline: Activate configuration <configuration>
    When the user taps the "General" button
    And the user switches configuration <configuration> to enable
    Then the user sees that the color has changed to green, indicating it is activated <configuration>

    Examples:
      | configuration               |
      | Share data to improve Tella |
      | Share crash reports         |
      | Verification mode           |
      | Recent files                |
      | Favorite forms              |
      | Favorite templates          |
      | Text Justification          |
      | Increse text spacing     |

  @Smoke @Candidate @E2E
  Scenario: Activate configuration Share data to improve Tella
    When the user taps the "General" button
    And the user switches configuration "Share data to improve Tella" to enable
    Then and approval message is displayed

 @Smoke @Candidate @E2E
  Scenario Outline: Activate configuration <configuration>
    And the user has files in Tella
    And the user has server connections in Tella
    And the user has templates in Tella
    When the user taps the "General" button
    And the user switches configuration <configuration> to enable
    And the user is back in Tella home page
    Then the user will be able to view the configuration <configuration> in the home page
    Examples:
      | configuration      |
      | Recent files       |
      | Favorite forms     |
      | Favorite templates |

  @SmokeManual @E2E @Candidate
  Scenario Outline: Activate configuration <configuration>
    When the user taps the "General" button
    And the user switches configuration <configuration> to enable
    And a sign is displayed that Tella will be refreshed to apply changes
    And the user taps the "General" button
    Then the user will be able to view the changes applied by the configuration <configuration>

    Examples:
      | configuration           |
      | Text Justification      |
      | Increase text spacing |