Feature: Import Files into the Tella App

Background:
  Given I am a logged-in user in the Tella App
  And I am on the main screen
  And there are image, video, audio, and document files on the device

Scenario: Import an Image into the IMAGES folder
  When I navigate to the IMAGES folder
  And I choose to import a photo
  And I select an image file from the device
  Then the image should be saved in the IMAGES folder

Scenario: Import a Video into the VIDEOS folder
  When I navigate to the VIDEOS folder
  And I choose to import a video
  And I select a video file from the device
  Then the video should be saved in the VIDEOS folder

Scenario: Import an Audio into the AUDIO folder
  When I navigate to the AUDIO folder
  And I choose to import an audio
  And I select an audio file from the device
  Then the audio should be saved in the AUDIO folder

Scenario: Import a Document into the DOCUMENTS folder
  When I navigate to the DOCUMENTS folder
  And I choose to import a document
  And I select a document file from the device
  Then the document should be saved in the DOCUMENTS folder

