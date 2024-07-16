@AboutAndHelp @Regression

Feature: About and Help

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon


  @Smoke @Android @ViewOptions
  Scenario Outline: <category> - view options
    When clicks on the category <category>
    Then view the Tella icon
    And the number version <version>
    And view a list options

    Examples:
      | category     | version             |
      | About & Help | Version 2.9.0 (179) |


  @Smoke @Android @FAQ @ContactUs @PrivacyPolicy
  Scenario Outline: <category> - go to FAQ page
    When clicks on the category <category>
    And taps the <option> option
    Then the user is redirected to the <site>

    Examples:
      | category     | option         | site                            |
      | About & Help | FAQ            | the Tella Documentation Website |
      | About & Help | Contact us     | email                           |
      | About & Help | Privacy policy | Tella Privacy Policy Website    |

