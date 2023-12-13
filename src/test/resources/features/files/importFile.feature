Feature: Import Files in Tella

  Background:
    Given the user has an account on Tella
    And has logged in to Tella
    And is within one of the main folders in the "files" section
    And there are valid files on their device

  Scenario Outline: Import a file of type <type> to Tella while keeping the original
    When the user selects the option to import a file
    And chooses to keep the original
    And selects a file of type <type> from the device
    Then the file is saved in the folder <folder>
    And the file of type <type> appears in the list of files in the folder <folder>

    Examples:
      | type  | folder    |
      | .jpg  | Images    |
      | .png  | Images    |
      | .MP4  | Videos    |
      | .MOV  | Videos    |
      | .MP3  | Audios    |
      | .AAC  | Audios    |
      | .PDF  | Documents |
      | .DOCX | Documents |

  Scenario Outline: Import a file of type <type> to Tella while deleting the original
    When the user selects the option to import a file
    And chooses to delete the original
    And selects a file of type <type> from the device
    Then the file is saved in the folder <folder>
    And the file of type <type> appears in the list of files in the folder <folder>

    Examples:
      | type  | folder    |
      | .jpg  | Images    |
      | .png  | Images    |
      | .MP4  | Videos    |
      | .MOV  | Videos    |
      | .MP3  | Audios    |
      | .AAC  | Audios    |
      | .PDF  | Documents |
      | .DOCX | Documents |

  Scenario Outline: Import a duplicated file of type <type> to Tella
    When the user selects the option to import a file
    And selects a file of type <type> that already exists in Tella
    Then the duplicated file is imported successfully with a different name
    And the file of type <type> appears in the list of files in the folder <folder>

    Examples:
      | type | folder    |
      | .jpg | Images    |
      | .MP4 | Videos    |
      | .MP3 | Audios    |
      | .PDF | Documents |