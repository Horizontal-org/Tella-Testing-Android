Feature: CameraAndVideo
  
@Smoke  
  Background:
  Given the user is in home page

Scenario: take a picture from tella
When the user press the "camera" button
And the user press the take a photo button
Then is a new picture in the "Images" folder
And the picture taked is not in device album

Scenario: add a picture from Tella´s "images" folder
When the user press the "Images" folder
And the user press "+" 
And the press "import from device"
And the user select a picture from device album
And the user press "photo library"
And the user press "keep the original"
Then is a new picture in the "Images" folder
And the picture taked keep in device album

Scenario: record a video from Tella
When the user press the button "camera"
And the user press "video" button
And the user press the take a video button 
Then is a new picture in the "Picture" folder
And the video taked is not in device album

Scenario: record an audio 
When the user press the "rec" button
And the user press the microphone button
And the user press the stop button
Then is a new audio file in "Audio" folder
And the audio teked is not in device album

Scenario: share photo from tella
When the user press the button "Images" folder
And the user press the three points button located a side to the file named "Tella.1"
And the user press the button "share"
And the user press the button "continue"
And the user press the button "gmail"
And the user write an email account "c...@gmail.com" and push the send it button
Then the file is shared

Scenario: share video from tella
When the user press the button "Videos" folder
And the user press the three points button located a side to the file named "tella video"
And the user press the button "share"
And the user press the button "continue"
And the user press the button "gmail"
And the user write an email account "c...@gmail.com" and push the send it button
Then the file is shared


Scenario: Rename a file with a existing name