Feature: PhotographyAndVideo
  
  Background:
  Given the user is in Tella´s home page

@Smoke @Photography
Scenario: take a picture from tella
  When the user press "camera"
  And the user press the take a photo button
  Then "File Encypted" message is shown
  And there is a new picture in the "Images" folder
  And the picture taked is not in device album

@Smoke @Photography
Scenario: take a picture from tella with the frontal camera
  When the user press "camera"
  And the user press the change camera button
  And the user press the take a photo button
  Then "File Encypted" message is shown
  And there is a new picture in the "Images" folder
  And the picture taked is not in device album

@Smoke @Photography @Android
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

@Smoke @Photography @Android
Scenario: Enable grid lines
  When the user press "camera"
  And the user press grid lines button, located a the top center of the screen
  Then the grid lines is activated

@Smoke @Video
Scenario: record a video from Tella
  When the user press "camera"
  And the user press "video" button
  And the user press the take a video button
  And the user press the stop video button
  Then "encrypting" message is shown
  And "File Encypted" message is shown
  And there is a new video in the "Videos" folder
  And the video taked is not in device album

@Smoke @Video
Scenario: record a video from Tella with the frontal camera
  When the user press "camera"
  And the user press "video"
  And the user press the change camera button
  And the user press the take a video button
  And the user press the stop video button
  Then "encrypting" message is shown
  And "File Encypted" message is shown
  And there is a new picture in the "Videos" folder
  And the video taked is not in device album

@Smoke
Scenario Outline: share file from tella by mail
  When the user press "camera"
  And The user press the photo located at the bottom right to the screen
  And the user press the three points button located at the top right screen 
  And the user press the button "share"
  And the user press the button "continue"
  And the user press the button <Mail>
  And the user write an email account "cfiguera83@hotmail.com" 
  And the user push the send it button
  Then the file is shared

 | Mail    |
 | Gmail   |
 | Correo  |

@Smoke
Scenario Outline: share file from tella
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Share"
  And the user press "continue"
  And the user press <type>
  And the user press <Button>
  And the user press "Share"
  And the user press "Done"
  Then the file is shared
  
  | type               | Button    |
  | Instagram Stories  | Next      |
  | WhtasApp           | Next      |
  | Photo Album        | Upload    |
 
@Smoke
Scenario Outline: share file from tella to instagram Reels
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "share"
  And the user press "continue"
  And the user press Instagram "Reels"
  And the user press "→" 
  And the user press "Share"
  Then The file is shared
  
@Smoke
Scenario Outline: share file from tella to Instagram Feed
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Share"
  And the user press "continue"
  And the user press Instagram "Feed"
  And the user press "→"
  And the user press "Next"
  And the user press "Share"
  Then the file is shared

@Smoke
Scenario Outline: share file from tella to Instagram Chats
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Share"
  And the user press "continue"
  And the user press Instagram "Chats"
  And the user press "Send" to a instagram account "cfiguera83"
  And the user press "Done"
  Then the file is shared
  
@Smoke
Scenario Outline: share file from tella to WhatsApp
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Share"
  And the user press "continue"
  And the user press "WhatsApp"
  And the user press on a WhatsApp contact "Tella"
  And the user press "→"
  And the user press "→"
  Then the file is shared

@Smoke 
Scenario: File information
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press the button "File information"
  Then the file information is in the screen

@Smoke
Scenario: Delete file
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Delete"
  And the user press "Delete"
  Then the file is deleted

@Smoke
Scenario: Save to device
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Save to device"
  And the user press "Save"
  And the user press "Continue"
  Then the file is saved 

@Smoke
Scenario: Rename file
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Raname"
  And the user write a new name "Tella1"
  And the user press "ok"
  Then the file is saved with the new name 

@Smoke
Scenario: Rename a file with a existing name
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Raname"
  And the user write the new name "Tella1"
  And the user press "ok"
  Then the sistem notified there is a existing file with the same name  
  
@Smoke @IOS
Scenario: Move to another folder 
  
  