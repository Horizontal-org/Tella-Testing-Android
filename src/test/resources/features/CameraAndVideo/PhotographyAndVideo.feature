@Regression
Feature: PhotographyAndVideo

  @Smoke @Photography
  Scenario:Take a photo with the back camera on Tella
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album

  @Smoke @Photography
  Scenario: take a photo with the frontal camera on Tella
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the change camera button
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album

  @Smoke @Photography
  Scenario: take a photo on Tella with Verification Mode on
    Given the user is in Tella´s home page
    And the Verification Mode is on
    When the user presses "camera"
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album
    And the verification information is collected correctly
    
  @Smoke @Photography
  Scenario: take a photo on Tella with Verification Mode on and GPS off
    Given the user is in Tella´s home page
    And the Verification Mode is on
    And the GPS is off
    When the user presses "camera"
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album
    And the verification information is collected correctly

  @Photography @Android
  Scenario:Turn on camera flash automatic mode
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses flash button
    Then the automatic flash mode is activated

  @Photography
  Scenario: Turn on camera flash
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses flash button
    And the user presses flash button
    Then the flash is activated

  @Smoke @Photography @Android
  Scenario: Enable grid lines
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses grid lines button
    Then the grid lines are activated

  @Video
  Scenario: Turn on the camera flash in video mode
    Given the user is in camera
    When the user presses "video" 
    And the user presses flash button
    Then the flash is activated

  @Video
  Scenario: Turn off camera flash in video mode
    Given the user is in camera
    When the user presses "video"
    And the user presses flash button
    And the user presses flash button
    Then the flash is off

  @Smoke @Video
  Scenario: Select video resolution
    Given the user is in camera
    When the user presses the video resolution button
    And the user presses "highest possible"
    And the user presses "next"
    Then the video resolution is selected

  @Smoke @Video
  Scenario: record a video from Tella
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses "video" button
    And the user presses the take a video button
    And the user presses the stop video button
    Then "encrypting" message is shown
    And "File Encypted" message is shown
    And there is a new video in the "Videos" folder
    And the video taked is not in device album

  @Smoke @Video
  Scenario: record a video from Tella with the frontal camera
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses "video"
    And the user presses the change camera button
    And the user presses the take a video button
    And the user presses the stop video button
    Then "encrypting" message is shown
    And "File Encypted" message is shown
    And there is a new picture in the "Videos" folder
    And the video taked is not in device album

  @Smoke @Video
  Scenario: record a video from Tella with Verification Mode on
    Given the user is in Tella´s home page
    And the Verification Mode is on
    When the user presses "camera"
    And the user presses "video" button
    And the user presses the take a video button
    And the user presses the stop video button
    Then there is a new video in the "Videos" folder
    And the video taked is not in device album
    And the verification information is collected correctly
    
  @Smoke @Video
  Scenario: record a video from Tella with Verification Mode on and GPS off
    Given the user is in Tella´s home page
    And the Verification Mode is on
    And the GPS is off
    When the user presses "camera"
    And the user presses "video" button
    And the user presses the take a video button
    And the user presses the stop video button
    Then there is a new video in the "Videos" folder
    And the video taked is not in device album
    And the verification information is collected correctly
  
  @Smoke
  Scenario Outline: share file from tella by mail
    Given the user is in Tella´s home page
    When the user press "camera"
    And The user presses the photo located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses the button "share"
    And the user presses the button "continue"
    And the user presses the button <Mail>
    And the user write an email account "cfiguera83@hotmail.com"
    And the user push the send it button "→"
    Then the file is shared

    Examples:
      | Mail   |
      | Gmail  |
      | Correo |


  @Smoke
  Scenario: share file from tella to Instagram Stories
    Given the user is in Tella´s home page and have an instagram account
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses "continue"
    And the user presses instagram "Stories"
    And the user presses "→"
    And the user presses "Share"
    And the user presses "Done"
    Then the file is shared

  @Smoke
  Scenario: share file from tella to instagram Reels
    Given the user is in Tella´s home page and have an instagram account
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "share"
    And the user presses "continue"
    And the user presses Instagram "Reels"
    And the user presses "→"
    And the user presses "Share"
    Then The file is shared

  @Smoke
  Scenario: share file from tella to Instagram Feed
    Given the user is in Tella´s home page and have an instagram account
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses "continue"
    And the user presses Instagram "Feed"
    And the user presses "→"
    And the user presses "Next"
    And the user presses "Share"
    Then the file is shared

  @Smoke
  Scenario: share file from tella to Instagram Chats
    Given the user is in Tella´s home page and have an instagram account
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses "continue"
    And the user presses Instagram "Chats"
    And the user presses "Send" to a instagram account "cfiguera83"
    And the user presses "Done"
    Then the file is shared

  @Smoke
  Scenario: share file from tella to WhatsApp
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses "continue"
    And the user presses "WhatsApp"
    And the user presses on a WhatsApp contact "Tella"
    And the user presses "→"
    And the user presses "→"
    Then the file is shared

  @Smoke
  Scenario: File information
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses the button "File information"
    Then the file information is in the screen

  @Smoke
  Scenario: Delete file
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Delete"
    And the user presses "Delete"
    Then the file is deleted

  @Smoke
  Scenario: Save to device
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the image located at the bottom right of the screen
    And the user presses the three points button located at the top right of the screen
    And the user presses "Save to device"
    And the user presses "Save"
    And the user presses "Continue"
    Then the file is saved

  @Smoke
  Scenario: Rename file
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the image located at the bottom right of the screen
    And the user presses the three points button located at the top right of the screen
    And the user presses "Raname"
    And the user write a new name "Tella1"
    And the user presses "ok"
    Then the file is saved with the new name

  @Smoke
  Scenario: Rename a file with an existing name
    Given the user is in Tella´s home page
    When the user presses "camera"
    And the user presses the image located at the bottom right of the screen
    And the user presses the three points button located at the top right of the screen
    And the user presses "Raname"
    And the user write the new name "Tella1"
    And the user presses "ok"
    Then the sistem notified there is a existing file with the same name

  @Smoke @IOS
  Scenario: Move a file to another folder
    Given the user is in camera
    When the user presses the image located at the bottom right of the screen
    And the user presses the image
    And the user presses the three points button located at the top right of the screen
    And the user presses "Move to another folder"
    And the user presses "+"
    And the user write a folder name "Tella"
    And the user presses "Create"
    And the user presses "tella" folder
    And the user presses "Move here"
    Then the image is moved to a new folder