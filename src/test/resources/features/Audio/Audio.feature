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

  @Smoke @Audio @Automated
  Scenario Outline: Rename an audio file
    When the user press the Rec option
    And the user press the pencil icon
    And the user delete the existing name pressing the delete button
    And the user write a new recording name <recording_name>
    And the user press ok
    Then the approval message <message_title> is displayed
    And the file change the original name for a new one: <recording_name>

    Examples:
      | recording_name | message_title                                     |
      | Audio1         | The audio recording was saved to your Tella files |

  @Smoke @Audio @Automated
  Scenario Outline: Rename an audio file during the recording
    When the user press the Rec option
    And the user press the microphone
    And the user press the pencil icon
    And the user delete the existing name pressing the delete button
    And the user write a new recording name <recording_name>
    And the user press ok
    And the user press stop option
    Then the approval message <message_title> is displayed
    And the file change the original name for a new one: <recording_name>

    Examples:
      | recording_name | message_title                                     |
      | Audio2         | The audio recording was saved to your Tella files |

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