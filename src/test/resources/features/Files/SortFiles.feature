@Regression @Files @SortFiles
Feature: Organize files in a folder

  Background:
    Given the user is in Tella home page

  @Smoke @ToBeAutomated @E2E
  Scenario Outline: Sort files by <sortBy> in the folder All files - E2E
    And the user has files loaded
    When the user enters the folder <folder>
    And the user taps the "Name ↑" icon
    And the user chooses to sort files in <sortBy> order
    Then the files are displayed according to the specified order

    Examples:
      | sortBy                | folder    |
      | From newest to oldest | All files |
      | From oldest to newest | All files |
      | Name A>Z              | All files |
      | Name Z>A              | All files |

  @Flow
  Scenario Outline: Sort files by <sortBy> in the folder <folder>
    And the user has files loaded
    When the user enters the folder <folder>
    And the user taps the "Name ↑" icon
    And the user chooses to sort files in <sortBy> order
    Then the files are displayed according to the specified order

    Examples:
      | sortBy                | folder    |
      | From newest to oldest | All files |
      | From oldest to newest | All files |
      | Name A>Z              | All files |
      | Name Z>A              | All files |
      | From newest to oldest | Documents |
      | From oldest to newest | Documents |
      | Name A>Z              | Documents |
      | Name Z>A              | Documents |
      | From newest to oldest | Images    |
      | From oldest to newest | Images    |
      | Name A>Z              | Images    |
      | Name Z>A              | Images    |
      | From newest to oldest | Videos    |
      | From oldest to newest | Videos    |
      | Name A>Z              | Videos    |
      | Name Z>A              | Videos    |
      | From newest to oldest | Audio     |
      | From oldest to newest | Audio     |
      | Name A>Z              | Audio     |
      | Name Z>A              | Audio     |

  @Smoke @ToBeAutomated @E2E
  Scenario Outline: Sort files by <view> in the folder All files - E2E
    And the user has files loaded
    When the user enters the folder <folder>
    And the user taps the <view> button
    Then the files are displayed according to the selected view

    Examples:
      | view | folder    |
      | grid | All files |
      | list | All files |

  @Flow
  Scenario Outline: Sort files by <view> in the folder <folder>
    And the user has files loaded
    When the user enters the folder <folder>
    And the user taps the <view> button
    Then the files are displayed according to the selected view

    Examples:
      | view | folder    |
      | grid | All files |
      | list | All files |
      | grid | Documents |
      | list | Documents |
      | grid | Images    |
      | list | Images    |
      | grid | Audio     |
      | list | Audio     |
      | grid | Videos    |
      | list | Videos    |

  @Smoke @E2E @ToBeAutomated
  Scenario: Folder-level sorting is independent between folders (Images vs Videos)
    And the user has files loaded
    And the user enters the folder "Images"
    And the user taps the "Name ↑" icon
    And the user chooses to sort files in "Name A>Z" order
    And the files are displayed according to the specified order
    And taps go back button
    And the user enters the folder "Videos"
    And the user taps the "Name ↑" icon
    And the user chooses to sort files in "Name Z>A" order
    And the files are displayed according to the specified order
    And taps go back button
    When the user enters the folder "Images"
    Then the files are displayed according to the specified order
