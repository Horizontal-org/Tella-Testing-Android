@Regression @AboutAndHelp @Settings
Feature: About and Help

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon

  @Smoke @Automated
  Scenario Outline: About & Help - view options
    When clicks on the category <category>
    Then view the Tella icon
    And the number version
    And view a list options

    Examples:
      | category     |
      | About & Help |

  @Smoke @SmokeManual
  Scenario Outline: About & Help - Go to <option> page
    When clicks on the category <category>
    And taps the <option> option
    Then the user is redirected to the <site>

    Examples:
      | category     | option         | site                               |
      | About & Help | Tutorial       | tella-app.org/get-started-android/ |
      | About & Help | FAQ            | tella-app.org/faq/                 |
      | About & Help | Privacy policy | tella-app.org/privacy/             |
      | About & Help | Contact us     | email                              |

