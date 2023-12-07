Feature: CameraAndVideo
  
@Smoke  
  Background:
  Given the user is in Tella´s home page

Scenario: take a picture from tella
  When the user press the "camera" button
  And the user press the take a photo button
  Then is a new picture in the "Images" folder
  And the picture taked is not in device album

Scenario: take a picture from tella with the frontal camera
  When the user press "camera"
  And the user press the change camera button, located at the topof the screen
  And the user press the take a photo button
  Then is a new picture in the "Images" folder
  And the picture taked is not in device album

Scenario: Turn on camera flash automatic mode
  When the user press "camera"
  And the user press flash button, located a the top right of the screen
  Then the automatic mode flash is activate
  
Scenario: Turn on camera flash
  When the user press "camera"
  And the user press flash button, located a the top right of the screen
  And the user press flash button
  Then the flash is activate

Scenario: Enable grid lines
  When the user press "camera"
  And the user press grid lines button, located a the top center of the screen
  Then the grid lines is activate

Scenario: add a picture from Tella´s "images" folder
  When the user press the "Images" folder
  And the user press "+" 
  And the user press "import from device"
  And the user select a picture from device album
  And the user press "photo library"
  And the user press "keep the original"
  Then is a new picture in the "Images" folder
  And the picture taked keep in device album

Scenario: record a video from Tella
  When the user press the button "camera"
  And the user press "video" button
  And the user press the take a video button
  And the user press the stop video button
  Then is a new picture in the "Picture" folder
  And the video taked is not in device album

Scenario: record a video from Tella with the frontal camera
  When the user press "camera"
  And the user press "video"
  And the user press the change camera button located at the top of the screen
  And the user press the take a video button
  And the user press the stop video button
  Then is a new picture in the "Picture" folder
  And the video taked is not in device album

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