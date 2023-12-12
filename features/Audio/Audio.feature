Feature: Audio
  
  Background: 
    Given the user is in Tella home page
    
    @Smoke @Audio
    Scenario: Record an audio file
      When the user press "Rec"
      And the user press the microphone
      And the user press stop
      Then is a new audio file "Audio" folder
    
    @Smoke @Audio
    Scenario: Record an audio file in two parts
      When the user press "Rec"
      And the user press the microphone
      And the user press pause
      And the user press the microphone
      And the user press stop
      Then is a new audio file in "Audio" folder
    
    @Smoke @Audio  
    Scenario: Rename an audio file
      When the user press "Rec"
      And the user press the pencil
      And the user write a new name "Audio1"
      And the user press ok
      Then the file change the original name for a new one
    
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
    Scenario: Pause an audio file and play again
      When the user press "Rec"
      And the user press headphones
      And the user press a file named "Audio1"
      And the user press play
      And the user press pause
      And the user press play
      Then the audio file is played
      
    @Smoke @Audio
    Scenario: Listen various audio files