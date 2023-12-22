Feature: File Options in the "Documents" Folder

  Background:
    Given that the user is unlocked in the Tella app
    And is within the "Documents" folder
    And there are files "docu1.pdf" and "docu2.pdf"

  @Smoke
  Scenario: Open a document from the "Documentos" folder
    When they click on a "docu1.pdf" in the "Documentos" folder
    Then the option to import the file appears to open it

  @Smoke
  Scenario: Rename a document file in the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Rename"
    And enters the name: "document"
    And presses "OK"
    Then the file name is updated

  @Smoke
  Scenario: Cancel renaming a document file in the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Rename"
    And enters the name: "document"
    And presses "CANCEL"
    Then the file name is not updated

  @Smoke @Regression
  Scenario: Rename a file with an identical name to an existing file in the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Rename"
    And enters the name: "docu2.pdf"
    And presses "OK"
    Then the file name is not updated

  @Smoke
  Scenario Outline: Share a document file through <SocialMedia> from the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Share"
    And taps "Continue"
    And selects <shareInformation>
    And taps "OK"
    And selects <SocialMedia>
    Then the file is shared successfully

    Examples:
      | SocialMedia | shareInformation                       |
      | WhatsApp    | share files + verification information |
      | WhatsApp    | share files only                       |
      | Instagram   | share files + verification information |
      | Instagram   | share files only                       |
      | Gmail       | share files + verification information |
      | Gmail       | share files only                       |

  @Smoke
  Scenario Outline: Share multiple document files through <SocialMedia> from the "Documents" folder
    When the user clicks the "v" button to select files
    And selects "docu1.pdf" and "docu2.pdf"
    And taps the "Share" button
    And taps "Continue"
    And selects <shareInformation>
    And taps "OK"
    And selects <SocialMedia>
    Then the files are shared successfully

    Examples:
      | SocialMedia | shareInformation                       |
      | WhatsApp    | share files + verification information |
      | WhatsApp    | share files only                       |
      | Instagram   | share files + verification information |
      | Instagram   | share files only                       |
      | Gmail       | share files + verification information |
      | Gmail       | share files only                       |

  @Smoke
  Scenario: Cancel sharing a document file from the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Share"
    And taps "Continue"
    And selects <shareInformation>
    And taps "CANCEL"
    Then the dialog box closes
    And the file is not shared

  @Smoke
  Scenario Outline: Save a document file to the device
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Save to device"
    And presses "Save"
    And selects <shareInformation>
    And taps "Continue"
    And selects a location on the device
    And presses the "USE THIS FOLDER" button
    Then the file is saved correctly to the device
    And the message "1 file saved to the device" appears

    Examples:
      | shareInformation                       |
      | share files + verification information |
      | share files only                       |

  @Smoke
  Scenario Outline: Save multiple document files to the device
    When the user clicks the "v" button to select files
    And selects "docu1.pdf" and "docu2.pdf"
    And selects the option "Save to device"
    And presses "Save"
    And selects <shareInformation>
    And taps "Continue"
    And selects a location on the device
    And presses the "USE THIS FOLDER" button
    Then the files are saved correctly to the device
    And the message "1 file saved to the device" appears

    Examples:
      | shareInformation                       |
      | share files + verification information |
      | share files only                       |

  @Smoke
  Scenario: Delete a document file from the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Delete"
    And taps "Delete"
    Then the file is deleted
    And the message "the file was deleted" appears

  @Smoke
  Scenario: Delete multiple document files from the "Documents" folder
    When the user clicks the "v" button to select files
    And selects "docu1.pdf" and "docu2.pdf"
    When taps the options button "⋮"
    And selects the option "Delete"
    Then the files are deleted
    And the message "the file was deleted" appears

  @Smoke
  Scenario: Cancel deleting a document file from the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "Delete"
    And taps "Cancel"
    Then the file is not deleted
    And the dialog box closes

  @Smoke
  Scenario: View information of a file from the "Documents" folder
    When the user taps the options button "⋮" for the file "docu1.pdf"
    And selects the option "File information"
    Then the file information appears
