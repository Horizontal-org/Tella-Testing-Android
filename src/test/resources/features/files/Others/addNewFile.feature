Feature: Add files from the "Others" folder

  Background:
    Given the user has an account on Tella
    And logs in to Tella
    And is within the "Others" folder

  Scenario Outline: Capture a file of type <type> from the "Others" folder
    When they tap the "+" button
    And select the option "Take photo/video"
    And select the option <option>
    And capture the file of type <type>
    Then the message "file encrypted" appears
    And the file of type <type> is saved correctly in the folder <folder>
    And the file of type <type> appears in the list of files in the folder <folder>

    Examples:
      | type   | folder   | option |
      | image  | Images   | photo  |
      | video  | Videos   | video  |

  Scenario: Record a document from the "Others" folder
    When they tap the "+" button
    And select the option "Record audio"
    And capture the audio
    Then the message "The audio recording was saved to your Tella files" appears
    And the audio file is saved correctly in the "Audio" folder
    And the audio file appears in the list of files in the "Audio" folder

