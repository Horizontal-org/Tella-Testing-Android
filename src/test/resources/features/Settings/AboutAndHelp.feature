@Regression @AboutAndHelp

Feature: About and Help

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon

  @Smoke @Automated
  Scenario Outline: About & Help - view options
    When clicks on the category <category>
    Then view the Tella icon
    And the number version <version>
    And view a list options

    Examples:
      | category     | version             |
      | About & Help | Version 2.9.0 (179) |

  @Smoke @Automated
  Scenario Outline: About & Help - Go to <option> page
    When clicks on the category <category>
    And taps the <option> option
    Then the user is redirected to the <site>

    Examples:
      | category     | option         | site                   |
      | About & Help | FAQ            | tella-app.org/docs/    |
      | About & Help | Privacy policy | tella-app.org/privacy/ |

    @Ignore @Bug
    Examples:
      | category     | option     | site  |
      | About & Help | Contact us | email |

