@Regression @Files @PlusButton
Feature: Plus button

  Background:
    Given the user is in Tella home page
    And Recent files are enabled to be displayed

  @Smoke @Photo @Video @CaptureFile @ToBeAutomated
  Scenario Outline: Capture a file of type <type> from folder <folder>
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option: Take photo or video
    And selects the option <option>
    And captures the file of type <type>
    Then the file of type <type> is saved correctly in the folder <folderSave> #You have no access to verify this step
    And the file appears in the list of files in the folder <folderSave>
    And the file appears in the "All files" folder

    Examples:
      | type  | folderSave | option | folder    |
      | image | Images     | Photo  | All files |
      | video | Videos     | Video  | All files |
      | image | Images     | Photo  | Images    |
      | video | Videos     | Video  | Videos    |

  @Regression @CaptureFile @ToBeAutomated
  Scenario Outline: Capture a file of type <type> with verification information and GPS off from folder <folder>
    Given the Verification Mode is on
    And GPS is off
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option: "Take photo/video"
    And selects the option <option>
    And captures the file of type <type>
    Then the file of type <type> is saved correctly in the folder <folderSave>
    And the file appears in the list of files in the folder <folderSave>
    And the file appears in the "Recent files" list
    And the file appears in the "All files" folder
    And the verification information is collected correctly

    Examples:
      | type  | folderSave | option | folder    |
      | image | Images     | Photo  | All files |
      | video | Videos     | Video  | All files |


  @Smoke @CaptureFile @ToBeAutomated
  Scenario Outline: Capture a <type> with Verification Mode ON
    Given the Verification Mode is on
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option: Take photo or video
    And captures the file of type <type>
    Then the file appears in the list of files in the folder <folderSave>
    And the file appears in the "Recent files" list
    And the file appears in the "All files" folder
    And the verification information is collected correctly

    Examples:
      | type  | folderSave | folder     |
      | image | Images     | All files  |
      | video | Videos     | All files  |

  @Smoke @ToBeAutomated
  Scenario Outline: Record an audio file from the folder <folder>
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option "Record audio"
    And captures the audio
    Then the message "The audio recording was saved to your Tella files" appears
    And the audio file is saved correctly in the "Audio" folder
    And the audio file appears in the list of files in the "Audio" folder
    And the audio file appears in the list of files in the "All files" folder
    And the file appears in the "Recent files" list

    Examples:
      | folder    |
      | All files |
      | Audio     |
      | Others    |

  @Smoke @SmokeManual
  Scenario Outline: Record an audio file with verification information and GPS off from the folder <folder>
    Given the Verification Mode is ON
    And GPS is OFF
    And recent files is ON
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option "Record audio"
    And captures the audio
    And the message "The audio recording was saved to your Tella files" appears
    And the audio file is saved correctly in the "Audio" folder
    And the audio file appears in the list of files in the "Audio" folder
    And the audio file appears in the list of files in the "All files" folder
    And the file appears in the "Recent files" list
    Then the verification information is collected correctly

    Examples:
      | folder    |
      | All files |
      | Audio     |
      | Others    |

  @Smoke @ToBeAutomated
  Scenario Outline: Record an audio file with verification information from the folder <folder>
    Given the Verification Mode is on
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option "Record audio"
    And captures the audio
    Then the message "The audio recording was saved to your Tella files" appears
    And the audio file is saved correctly in the "Audio" folder
    And the audio file appears in the list of files in the "Audio" folder
    And the audio file appears in the list of files in the "All files" folder
    And the file appears in the "Recent files" list
    And the verification information is collected correctly

    Examples:
      | folder    |
      | All files |
      | Audio     |
      | Others    |

  @Smoke @SmokeManual
  Scenario Outline: Import a file of type <type> from a folder <folder> - preserving the original
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option "Import from device"
    And taps the option "Keep original"
    And selects a file of type <type> from the device
    Then the file is saved in the folder <folderSave>
    And the file of type <type> appears in the list of files in the folder <folderSave>
    And the file appears in the "All files" folder
    And the file appears in the "Recent files" list

    Examples:
      | type     | folderSave | folder    |
      | image    | Images     | All files |
      | video    | Videos     | All files |
      | audio    | Audio      | All files |
      | document | Documents  | All files |
      | document | Documents  | Documents |
      | image    | Images     | Images    |
      | audio    | Audio      | Audio     |
      | video    | Videos     | Videos    |

  Scenario Outline: Import a file of type <type> from a folder <folder> - deleting the original
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option "Import from device"
    And taps the option "Delete original"
    And selects a file of type <type> from the device
    Then the file is saved in the folder <folderSave>
    And the file of type <type> appears in the list of files in the folder <folderSave>
    And the file appears in the "Recent files" list
    And the original file is deleted from the device

    Examples:
      | type     | folderSave | folder    |
      | image    | Images     | All files |
      | video    | Videos     | All files |
      | audio    | Audio      | All files |
      | document | Documents  | All files |
      | document | Documents  | Documents |
      | image    | Images     | Images    |
      | audio    | Audio      | Audio     |
      | video    | Videos     | Videos    |

  Scenario Outline: Import a duplicate file of type <type> from folder <folder>
    Given the user has a file of type <type> imported into the folder <folder>
    When the user enters the folder <folder>
    And taps the "+" button
    And selects the option "Import from device"
    And taps the option "Keep original"
    And selects the same imported file of type <type> from the device
    Then the duplicate file is imported correctly with a different name
    And the file of type <type> appears in the list of files in the folder <folderSave>
    And the file appears in the "All Files" folder

    Examples:
      | type     | folderSave | folder    |
      | image    | Images     | All files |
      | video    | Videos     | All files |
      | audio    | Audios     | All files |
      | document | Documents  | All files |

  @Smoke @SmokeManual
  Scenario: Open a pdf file successfully
    When the user enters the "Documents" folder
    And taps the "+" button
    And selects the option "Import from device"
    And taps the option "Keep original"
    And selects a PDF file from the device
    And opens the PDF file from the "Documents" folder
    Then views the PDF file correctly

  @Smoke @ToBeAutomated
  Scenario: Successfully add a folder
    When the user enters the "All Files" folder
    And taps the "+" button
    And selects the option "Create a new folder"
    And enters a folder name: "folder1"
    And presses "Ok"
    Then a folder named "folder1" is created in the "All Files" section

  Scenario: Successfully add a folder inside another folder
    Given the user has a folder named "folder1" in the "All Files" folder on the Tella homepage
    When the user enters the "All Files" folder
    And enters "folder1"
    And taps the "+" button
    And selects the option "Create a new folder"
    And enters a folder name: "folder2"
    And presses "Ok"
    Then "folder2" is successfully created inside "folder1"

  Scenario: Fail to add a new folder with a duplicate name
    Given the user has a folder named "folder1" in the "All Files" folder on the Tella homepage
    When the user enters the "All Files" folder
    And taps the "+" button
    And selects the option "Create a new folder"
    And enters a folder name: "folder1"
    And presses "Ok"
    Then the new folder "folder1" is not created