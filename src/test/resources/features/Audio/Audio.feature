@Regression @Audio
Feature: Audio

  Background:
    Given the user is in Tella home page

  @Smoke @Automated
  Scenario Outline: Record an audio file
    When the user press the Rec option
    And the user press the microphone
    And the user press stop option
    Then the approval message <message_title> is displayed

    Examples:
      | message_title                                     |
      | The audio recording was saved to your Tella files |

  @Smoke @Automated
  Scenario Outline: Record an audio file in two parts
    When the user press the Rec option
    And the user press the microphone
    And the user press pause
    And the user press the microphone again
    And the user press stop option
    Then the approval message <message_title> is displayed

    Examples:
      | message_title                                     |
      | The audio recording was saved to your Tella files |

  @Smoke @Automated
  Scenario Outline: Rename an audio file
    When the user press the Rec option
    And the user press the pencil icon
    And the user delete the existing name pressing the delete button
    And the user write a new recording name <recording_name>
    And the user press ok
    Then the file change the original name for a new one: <recording_name>

    Examples:
      | recording_name |
      | Audio1         |

  @Smoke @Automated
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

  @IOS
  Scenario: Audio file editing from folder
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the settings icon
    And the user taps edit
    When the user edit the audio with the bars
    And the user taps the scissors
    Then a new audio will be saved
    And the message "Your changes have been saved." is displayed

  @IOS
  Scenario: Audio file editing from audio file
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the audio file
    And A the user taps edit
    When the user edit the audio with the bars
    And the user taps the scissors
    Then a new audio will be saved
    And the message "Your changes have been saved." is displayed

  @IOS
  Scenario: Reset the audio file editing
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the audio file
    And A the user taps edit
    When the user edit the audio with the bars
    And the user taps X button
    Then the edit bars will reset to their initial position

  @IOS
  Scenario: Re-play the audio file editing
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the audio file
    And A the user taps edit
    When the user edits the audio with the bars
    And the user taps play button
    Then only what was edited will be played

  @IOS
  Scenario: Cancel the audio file editing from audio file
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the audio file
    And A the user taps edit
    When the user edits the audio with the bars
    And the user taps X Edit Audio
    And the user taps "EXIT WITHOUT SAVING"
    Then the original audio will be displayed ready to listen to

  @IOS
  Scenario: Cancel the audio file editing from folder
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the settings icon
    And the user taps edit
    When the user edits the audio with the bars
    And the user taps X Edit Audio
    And the user taps "EXIT WITHOUT SAVING"
    Then no new edited file will be shown in the Audio folder

  @IOS
  Scenario: Audio cannot be trimmed less than 3 seconds
    And the user has recorded audio
    And the user enters the audio folder
    And the user taps the settings icon
    And the user taps edit
    When the user edits the audio with the bars
    And the user cuts the audio in 3 seconds
    Then the user will not be able to move the edit bars less than 5 seconds

  @IOS
  Scenario: Audio cannot be edited if it is less than 3 seconds
    And the user has recorded audio with a duration of 3 seconds
    And the user enters the audio folder
    And the user taps the settings icon
    When the user taps edit
    And the message "The audio cannot be trimmed because it is shorter than 3 seconds." is displayed


  Scenario: Listen an audio file
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    Then the audio file is reproduced

  Scenario: Pause an audio file
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    And the user press pause
    Then the audio file is paused

  Scenario: Pause an audio file and play it again
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    And the user press pause
    And the user press play
    Then the audio file is played

  Scenario: Rewind audio file
    When the user press "Rec"
    And the user press headphones
    And the user press a file named "Audio1"
    And the user press play
    And the user press rewind
    Then the audio file is reproduced again