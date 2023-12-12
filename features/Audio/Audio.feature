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