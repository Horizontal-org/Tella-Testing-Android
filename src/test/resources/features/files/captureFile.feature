Feature: Capture an image, video, and audio file from a folder

  Scenario Outline: Capture a file of type <type> from a folder in Tella
    Given the user has an account on Tella
    And logs in to Tella
    And is within one of the main folders in the "files" section
    When selects the option to add a file of type <type>
    And captures the file of type <type>
    Then the file of type <type> is successfully saved in the folder <folder>
    And the file of type <type> appears in the list of files in the folder <folder>

    Examples:
      | type  | folder |
      | image | Images |
      | video | Videos |
      | audio | Audios |