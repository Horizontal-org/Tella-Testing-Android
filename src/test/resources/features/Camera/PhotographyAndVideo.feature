@Regression @PhotographyAndVideo
Feature: PhotographyAndVideo

  Background:
    Given the user is in Tella home page

  @Smoke @Photography @SmokeManual
  Scenario:Take a photo with the back camera on Tella
    When the user presses the camera button
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album

  @Smoke @Photography @SmokeManual
  Scenario: take a photo from Camera with the frontal camera on Tella
    When the user presses the camera button
    And the user presses the change camera button
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album

  @Smoke @Photography @SmokeManual
  Scenario:General - Take a photo from Camera with Verification Mode on
    Given the Verification Mode is on
    When the user presses the camera button
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album
    And the verification information is collected correctly

  @Smoke @Photography @SmokeManual
  Scenario:General - Take a photo from Camera with Verification Mode on and GPS (of device) off
    Given the Verification Mode is on
    And the GPS is off
    When the user presses the camera button
    And the user presses the take a photo button
    Then there is a new picture in the "Images" folder on Tella
    And the picture taken is not in the device's album
    And the verification information is collected correctly

  Scenario:Turn on camera flash automatic mode
    When the user presses the camera button
    And the user presses flash button
    Then the automatic flash mode is activated

  Scenario: Turn on camera flash
    When the user presses the camera button
    And the user presses flash button
    And the user presses flash button
    Then the flash is activated

  @Smoke @Photography @Automated
  Scenario: Enable grid lines
    When the user presses the camera button
    And the user presses grid lines button
    Then the grid lines are now activated

  Scenario: Zoom in with the camera
    When the user presses the camera button
    And the user zooms in
    Then the image to be taken is enlarged

  Scenario: Turn on the camera flash in video mode
    When the user presses the camera button
    And the user presses the video button
    And the user presses flash button
    Then the flash is activated

  Scenario: Turn off camera flash in video mode
    When the user presses the camera button
    And the user presses the video button
    And the user presses flash button
    And the user presses flash button
    Then the flash is off

  @Smoke @Video @Automated
  Scenario: Select video resolution
    When the user presses the camera button
    And the user presses the video button
    When the user presses the configurations button
    And the user presses the option highest possible
    And the user presses the next button
    Then the video resolution is selected

  @Smoke @Video @SmokeManual
  Scenario: Check file size from the last file
    Given that the last file is a video with the highest resolution
    When the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "File information"
    Then The video size is congruent with the video resolution

  @Smoke @Video @SmokeManual
  Scenario: Record a video from Camera
    When the user presses the camera button
    And the user presses the video button
    And the user presses the take a video button
    And the user presses the stop video button
    Then there is a new video in the "Videos" folder
    And the video taken is not in the device's album

  @Smoke @Video @SmokeManual
  Scenario: record a video from Camera with the frontal camera
    When the user presses the camera button
    And the user presses the video button
    And the user presses the change camera button
    And the user presses the take a video button
    And the user presses the stop video button
    Then there is a new video in the "Videos" folder
    And the video taken is not in the device's album

  @Smoke @Video @SmokeManual
  Scenario: record a video from Camera with Verification Mode on
    And the Verification Mode is on
    When the user presses the camera button
    And the user presses the video button
    And the user presses the take a video button
    And the user presses the stop video button
    Then there is a new video in the "Videos" folder
    And the video taken is not in the device's album
    And the verification information is collected correctly

  @Smoke @Video @SmokeManual
  Scenario: record a video from Camera with Verification Mode on and GPS off
    And the Verification Mode is on
    And the GPS is off
    When the user presses the camera button
    And the user presses the video button
    And the user presses the take a video button
    And the user presses the stop video button
    Then there is a new video in the "Videos" folder
    And the video taken is not in the device's album
    And the verification information is collected correctly

  @Smoke @ShareFile @SmokeManual
  Scenario: share file from Tella by Gmail
    And the user has an email account registered on the cell phone
    When the user presses the camera button
    And the user takes a photography
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses the Gmail button
    And the user writes an email account "cfiguera83@hotmail.com"
    And the user push the send it button "→"
    Then the file is shared

  @Smoke @ShareFile @SmokeManual
  Scenario: share file from Tella to Instagram Stories
    And the user has an instagram account
    When the user presses the camera button
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses instagram "Stories"
    And the user presses "→"
    And the user presses "Share"
    And the user presses "Done"
    Then the file is shared

  @Smoke @ShareFile @SmokeManual
  Scenario: share file from Tella to Instagram Reels
    And the user has an instagram account
    When the user presses the camera button
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses Instagram "Reels"
    And the user presses "→"
    And the user presses "Share"
    Then The file is shared

  @Smoke @ShareFile @SmokeManual
  Scenario: share file from Tella to Instagram Feed
    And the user has an instagram account
    When the user presses the camera button
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses Instagram "Feed"
    And the user presses "→"
    And the user presses "Next"
    And the user presses "Share"
    Then the file is shared

  @Smoke @ShareFile @SmokeManual
  Scenario: share file from tella to Instagram Chats
    And the user has an instagram account
    When the user presses the camera button
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses Instagram "Chats"
    And the user presses "Send" to an existing Instagram account
    And the user presses "Done"
    Then the file is shared

  @Smoke @ShareFile @SmokeManual
  Scenario: share file from tella to WhatsApp
    And the user has WhatsApp
    When the user presses the camera button
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses "Share"
    And the user presses "WhatsApp"
    And the user presses on a WhatsApp contact
    And the user presses "→"
    And the user presses "→"
    Then the file is shared

  @Smoke @File @Automated
  Scenario: File information
    When the user presses the camera button
    And the user takes a photography
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses the button File information
    Then the file information is in the screen

  @Smoke @Automated
  Scenario: Delete file
    And the user presses the camera button
    And the user takes a photography
    When the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses Delete button
    And the user presses confirm Delete button
    Then the file is deleted

  Scenario: Cancel deleting the file
    When the user presses the camera button
    And the user takes a photography
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses Delete button
    And the user presses "Cancel"
    Then the file is not deleted

  @Smoke @File @SmokeManual
  Scenario: Save a file to the device with its verification information
    And the Verification mode is on
    When the user presses the camera button
    And the user takes a photography
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses Save to device button
    And the user presses "Save"
    And the user selects a folder to save in
    And the user presses "Use this folder"
    And the user presses "Allow"
    Then the file is saved in the device
    And its verification information is available

  @Smoke @File @SmokeManual
  Scenario: Cancel saving a file to the device.
    When the user presses the camera button
    And the user takes a photography
    And the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses Save to device button
    And the user presses "Cancel"
    Then saving a file to the device is canceled

  @Smoke @File @Automated
  Scenario: Rename file
    And the user presses the camera button
    And the user takes a photography
    When the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses Rename button
    And the user writes a new name "Tella"
    And the user enters the images folder
    Then the file is saved with the new name

  @Smoke @File @Automated
  Scenario: Rename a file with an existing name
    And the user have a photo taken named "Tella"
    And the user presses the camera button
    And the user takes a photography
    When the user presses the image located at the bottom right to the screen
    And the user presses the three points button located at the top right screen
    And the user presses Rename button
    And the user writes a new name "Tella"
    Then the sistem notified there is a existing file with the same name
    Then the message "File name taken. Please use a different one." is displayed

  Scenario: Exit from the camera
    When the user presses the camera button
    And the user presses "x" located at the top left corner
    Then the camera is closed
    And the homepage appears

  Scenario: Exit from the last file
    When the user presses the camera button
    And the user takes a photography
    And the user presses the image located at the bottom right to the screen
    And the user presses "→"
    Then the user exits from the last file
    And the photo camera appeared

  @Smoke @Photography @SmokeManual
  Scenario Outline: Edit an image by <Modification> from the last camera file
    When the user presses the camera button
    And the user presses the take a photo button
    And the user presses the image located at the bottom right to the screen
    And taps the crop tool button
    And performs the <Modification>
    And taps the checkmark button
    Then the modification is saved as a new image

    Examples:
      | Modification |
      | cropping     |
      | rotation     |