Feature: Audio
  
  Background: 
    Given the user is in Tella home page
    
    Scenario: Record an audio file
      When the user press "Rec"
      And the user press the microphone
      And the user press stop
      Then is a new audio file "Audio" folder
    
    Scenario: Record an audio in two parts
      When the user press "Rec"
      And the user press the microphone
      And the user press pause
      And the user press the microphone
      And the user press stop
      Then is a new audio file in "Audio" folder
      
    Scenario: Rename an audio file
      When the user press "Rec"
      And the user press the pencil
      And the user write a new name "Audio1"
      And the user press ok
      Then the file change the original name for a new one
    
    Scenario: Listen an audio file
      When the user press "Rec"
      And the user press headphones
      And the user press a file named "Audio1"
      And the user press play
      Then the audio file is reproduced