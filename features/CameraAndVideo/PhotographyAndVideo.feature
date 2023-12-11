Feature: PhotographyAndVideo
  
  Background:
  Given the user is in Tella´s home page

@Smoke @Photography
Scenario: take a picture from tella
  When the user press the "camera" button
  And the user press the take a photo button
  Then is a new picture in the "Images" folder
  And the picture taked is not in device album

@Smoke @Photography
Scenario: take a picture from tella with the frontal camera
  When the user press "camera"
  And the user press the change camera button, located at the topof the screen
  And the user press the take a photo button
  Then is a new picture in the "Images" folder
  And the picture taked is not in device album

@Smoke @Photography
Scenario: Turn on camera flash automatic mode
  When the user press "camera"
  And the user press flash button, located a the top right of the screen
  Then the automatic mode flash is activate

@Smoke @Photography
Scenario: Turn on camera flash
  When the user press "camera"
  And the user press flash button, located a the top right of the screen
  And the user press flash button
  Then the flash is activate

@Smoke @Photography
Scenario: Enable grid lines
  When the user press "camera"
  And the user press grid lines button, located a the top center of the screen
  Then the grid lines is activated

@Somke @Photography
Scenario: add a picture from Tella´s "images" folder
  When the user press the "Images" folder
  And the user press "+" 
  And the user press "import from device"
  And the user select a picture from device album
  And the user press "photo library"
  And the user press "keep the original"
  Then is a new picture in the "Images" folder
  And the picture taked keep in device album

@Smoke @Video
Scenario: record a video from Tella
  When the user press the button "camera"
  And the user press "video" button
  And the user press the take a video button
  And the user press the stop video button
  Then is a new picture in the "Picture" folder
  And the video taked is not in device album

@Smoke @Video
Scenario: record a video from Tella with the frontal camera
  When the user press "camera"
  And the user press "video"
  And the user press the change camera button located at the top of the screen
  And the user press the take a video button
  And the user press the stop video button
  Then is a new picture in the "Picture" folder
  And the video taked is not in device album

@Smoke @Photography
Scenario: share photo from tella
  When the user press "camera"
  And The user press the photo located at the bottom right to the screen
  And the user press the three points button located at the top right screen 
  And the user press the button "share"
  And the user press the button "continue"
  And the user press the button "gmail"
  And the user write an email account "cfiguera83@gmail.com" 
  And the user push the send it button
  Then the file is shared

@Smoke @Video
Scenario: share video from tella
  When the user press "camera"
  And the user press "video"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press the button "share"
  And the user press the button "continue"
  And the user press the button "gmail"
  And the user write an email account "cfiguera83@gmail.com" and push the send it button
  Then the file is shared

@Smoke  @Photography
Scenario: File information
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press the button "File information"
  Then the file information isin the screen

@Smoke  @Video
Scenario: Delete file
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Delete"
  And the user press "Delete"
  Then the file is deleted

@Smoke  @Video
Scenario: Save to device
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Save to device"
  And the user press "Save"
  And the user press "Continue"
  Then the file is saved 

@Smoke  @Video
Scenario: Rename file
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Raname"
  And the user write the new name "Tella1"
  And the user press "ok"
  Then the file is saved with the new name 

@Smoke @Video
Scenario: Rename a file with a existing name
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Raname"
  And the user write the new name "Tella1"
  And the user press "ok"
  Then the sistem notified there is a existing file with the same name  
  
  
  
  