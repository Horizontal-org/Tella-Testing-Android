Feature: Delete files in Tella

Background:
    Given the user has an account on Tella
    And has logged in to Tella
    And is within one of the main folders in the "files" section
    And there are files inside Tella

Scenario Outline: Delete a file of type <type> in Tella
    When they select to delete the <type> file from the list
    And confirm the deletion
    Then the <type> file is removed from the folder

    Examples:
        | type     |
        | image    |
        | video    |
        | audio    |
        | document |

Scenario Outline: Delete multiple files of different types <types> in Tella
    When the user selects multiple files of types <types>
    And selects to delete
    And confirms the deletion
    Then the files are removed from the folder

    Examples:
        | types                  |
        | image, video           |
        | audio, document, image |
        | video, audio           |
