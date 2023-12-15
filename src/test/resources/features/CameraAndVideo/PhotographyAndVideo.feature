Feature: PhotographyAndVideo
  
@Smoke @Photography
Scenario: take a picture from tella
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the take a photo button
  Then "File Encypted" message is shown
  And there is a new picture in the "Images" folder
  And the picture taked is not in device album

@Smoke @Photography
Scenario: take a picture from tella with the frontal camera
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the change camera button
  And the user press the take a photo button
  Then "File Encypted" message is shown
  And there is a new picture in the "Images" folder
  And the picture taked is not in device album

@Smoke @Photography @Android
Scenario: Turn on camera flash automatic mode
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press flash button, located a the top right of the screen
  Then the automatic mode flash is activate

@Smoke @Photography
Scenario: Turn on camera flash
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press flash button, located a the top right of the screen
  And the user press flash button
  Then the flash is activate

@Smoke @Photography @Android
Scenario: Enable grid lines
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press grid lines button, located a the top center of the screen
  Then the grid lines is activated

@Smoke @Video
Scenario: Turn on camera flash using the video mode
  Given the user is in camera
  When the user press flash button, located a the top right of the screen
  Then the flash is activate

@Smoke @Video
Scenario: Turn off camera flash using the video mode
  Given the user is in camera
  When the user press flash button, located a the top right of the screen
  And the user press flash button
  Then the flash is off
  
@Somke @Video
Scenario: Select video resolution
  Given the user is camera
  When the user press the video resolution button, located at the top center of the screen 
  And the user press "Highest possible"
  And the user press "NEXT"
  Then the video resolution is selected
  
@Smoke @Video
Scenario: record a video from Tella
  Given the user is in Tella´s home page
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
  Given the user is in Tella´s home page
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
  Given the user is in Tella´s home page
  When the user press "camera"
  And The user press the photo located at the bottom right to the screen
  And the user press the three points button located at the top right screen 
  And the user press the button "share"
  And the user press the button "continue"
  And the user press the button <Mail>
  And the user write an email account "cfiguera83@hotmail.com" 
  And the user push the send it button "→"
  Then the file is shared

 | Mail    |
 | Gmail   |
 | Correo  |

@Smoke
Scenario Outline: share file from tella to Instagram Stories
  Given the user is in Tella´s home page and have an instagram account
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Share"
  And the user press "continue"
  And the user press instagram "Stories"
  And the user press "→"
  And the user press "Share"
  And the user press "Done"
  Then the file is shared
  
@Smoke
Scenario Outline: share file from tella to instagram Reels
  Given the user is in Tella´s home page and have an instagram account
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
  Given the user is in Tella´s home page and have an instagram account
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
  Given the user is in Tella´s home page and have an instagram account
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
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press the button "File information"
  Then the file information is in the screen

@Smoke
Scenario: Delete file
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the image located at the bottom right to the screen
  And the user press the three points button located at the top right screen
  And the user press "Delete"
  And the user press "Delete"
  Then the file is deleted

@Smoke
Scenario: Save to device
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Save to device"
  And the user press "Save"
  And the user press "Continue"
  Then the file is saved 

@Smoke
Scenario: Rename file
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Raname"
  And the user write a new name "Tella1"
  And the user press "ok"
  Then the file is saved with the new name 

@Smoke
Scenario: Rename a file with a existing name
  Given the user is in Tella´s home page
  When the user press "camera"
  And the user press the image located at the bottom right of the screen
  And the user press the three points button located at the top right of the screen
  And the user press "Raname"
  And the user write the new name "Tella1"
  And the user press "ok"
  Then the sistem notified there is a existing file with the same name 
  
@Smoke @IOS
Scenario: Move a file to another folder
  Given the user is in camera
  When the user press the image located at the bottom right of the screen
  And the user press the image
  And the user press the three points button located at the top right of the screen
  And the user press "Move to another folder"
  And the user press "+"
  And the user write a folder name "Tella"
  And the user press "Create"
  And the user press "tella" folder
  And the user press "Move here"
  Then the image is moved to a new folder

  
  
  