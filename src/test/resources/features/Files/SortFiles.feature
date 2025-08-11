@Regression @Files @SortFiles
Feature: Organize files in a folder

  Background:
    Given the user is in Tella home page

  @Smoke @ToBeAutomated
  Scenario Outline: Sort files by <sortBy> in the folder <folder>
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
    
  Scenario Outline: Sort files by <view> in the folder <folder>
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


    nuevos añadidos x gpt
  @Smoke @E2E @Automated
  Scenario: Sort by date (newest ↔ oldest) with two freshly captured photos
    When the user enters the folder "Images"
    And taps the "+" button
    And selects the option: Take photo or video
    And selects the option Photo
    And captures the file of type image
    And the user waits 5 seconds
    And taps the "+" button
    And selects the option: Take photo or video
    And selects the option Photo
    And captures the file of type image

  # Newest → Oldest
    And the user taps the "Name ↑" icon
    And the user chooses to sort files in "From newest to oldest" order
    Then the first listed file is the last captured one

  # Oldest → Newest
    And the user chooses to sort files in "From oldest to newest" order
    Then the first listed file is the first captured one

  # Cleanup
    When taps the options button ⋮ of the first listed file
    And the user presses Delete button
    And the user presses confirm Delete button
    And taps the options button ⋮ of the first listed file
    And the user presses Delete button
    And the user presses confirm Delete button
    Then the sucessfull message "The files were deleted." appears
