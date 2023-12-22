Feature: Rec

  Background:
    Given the user is authenticated in the Tella application with valid credentials "654321"
    And is on the main page

  @Smoke @Audio
  Scenario: Record an audio file
    When the user press "Rec"
    And the user press the microphone
    And the user press stop
    Then "The audio recording was saved to your Tella files" message is shown

  @Smoke @Audio
  Scenario: Record an audio file in two parts
    When the user press "Rec"
    And the user press the microphone
    And the user press pause
    And the user press the microphone
    And the user press stop
    Then "The audio recording was saved to your Tella files" message is shown

  @Smoke @Audio @Automation
  Scenario: Rename an audio file
    When the user press "Rec"
    And the user press the pencil
    And the user delete the existing name pressing the delete button
    And the user write a new name "Audio1"
    And the user press ok
    Then "the audio reccording was saved to your Tella Files" message is shown
    And the file change the original name for a new one

  @Smoke @Audio @Automation234
  Scenario Outline: Rename an audio file during the recording
    When the user taps the Rec option
    And the user press the microphone
    And the user press the pencil icon
    And the user delete the existing name pressing the delete button
    And the user write a new recording name <recording_name>
    And the user press ok
    And the user press stop
    Then "the audio reccording was saved to your Tella Files" message is shown
    And the file change the original name for a new one

    Examples:
      | recording_name |
      | Audio2       |

  @Smoke @Audio
  Scenario: Listen an audio file
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    Then the audio file is reproduced

  @Smoke @Audio
  Scenario: Pause an audio file
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    And the user press pause
    Then the audio file is paused

  @Smoke @Audio
  Scenario: Pause an audio file and play it again
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    And the user press pause
    And the user press play
    Then the audio file is played

  @Smoke @Audio
  Scenario: Rewind audio file
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    And the user press rewind
    Then the audio file is reproduced again