@FileOptions @Regression
Feature: File Options

  Background:
    Given that the user is unlocked in the Tella application
    And there are files and folders within Tella
    And they are on the Tella Home screen

 @Smoke @Automatable
 Scenario Outline: Open a multimedia file <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps on a <type> file
   Then the <type> file is opened
   
   Examples:
     | folder     | type   |
     | All files  | image  |
     | Images     | image  |
     | Videos     | video  |
     | Audio      | audio  |

 @Automatable
 Scenario Outline: Rename a file of <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" of the <type> file
   And selects the option "Rename"
   And enters the name: "asdf"
   And presses "OK"
   Then the file name is updated
   
   Examples:
     | folder     | type      |
     | Images     | image     |
     | Documents  | document  |
     | Audios     | audio     |
     | Videos     | video     |

 Scenario Outline: Rename a file <type> with a name identical to an existing file
   When the user enters the folder <folder>
   And taps the options button "⋮" of a <type> file
   And selects the option "Rename"
   And enters the name: "asdf"
   And presses "OK"
   And the user taps the options button "⋮" of another <type> file
   And selects the option "Rename"
   And enters the name: "asdf"
   And presses "OK"
   Then the file name is not updated
   
   Examples:
     | folder     | type      |
     | Images     | image     |
     | Documents  | document  |
     | Audio      | audio     |
     | Videos     | video     |

 Scenario Outline: Edit an image <Modification> from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the image file
   And selects the option "Edit"
   And makes the <modification>
   And taps the checkmark button "Checkbox"
   Then the modification is saved as a new image
   And the message "Changes saved successfully" appears
   
   Examples:
     | Modification | folder    |
     | Crop         | Images    |
     | Rotate       | Images    |

 @Smoke
 Scenario Outline: Share a file created in Tella of <type> via <SocialMedia> from folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Share"
   And taps "Continue"
   And selects <shareInfo>
   And taps "OK"
   And selects <SocialMedia>
   Then the file is successfully shared
   
   Examples:
     | SocialMedia | shareInfo                                       | folder     | type     |
     | WhatsApp    | share files + verification information          | Images     | image    |
     | WhatsApp    | share only files                                | Videos     | video    |
     | WhatsApp    | share files + verification information          | Audios     | audio    |

 Scenario Outline: Share a file not created in Tella of <type> via <SocialMedia> from folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Share"
   And taps "Continue"
   And taps "OK"
   And selects <SocialMedia>
   Then the file is successfully shared
   
   Examples:
     | SocialMedia | folder    | type       |
     | WhatsApp    | Documents | document   |
     | WhatsApp    | Images    | image      |
     | WhatsApp    | Videos    | video      |
     | WhatsApp    | Audios    | audio      |
  
 Scenario Outline: Share multiple files created in Tella of <type> via <SocialMedia> from the folder <folder>
   When the user enters the folder <folder>
   And taps the "Checkbox" button
   And selects multiple <type> files
   And taps the options button "⋮"
   And selects the option "Share"
   And taps "Continue"
   And selects <shareInfo>
   And taps "OK"
   And selects <SocialMedia>
   Then the files are successfully shared
   
   Examples:
     | SocialMedia | shareInfo                              | type                          | folder     |
     | WhatsApp    | share files + verification information | image                         | Images     |
     | WhatsApp    | share files + verification information | video                         | Videos     |
     | WhatsApp    | share files + verification information | audio                         | Audios     |

 @Smoke @Automatable
 Scenario Outline: Save a file of <type> to the device from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Save to device"
   And presses "Save"
   And selects <shareInfo>
   And taps "Continue"
   And selects a location on the device
   And presses the "USE THIS FOLDER" button
   Then the <type> file is successfully saved to the device
   And the message "1 file saved to the device" appears
   
   Examples:
     | shareInfo                               | type      | folder     |
     | share only files                        | image     | Images     |
     | share files + verification information  | video     | Videos     |
     | share only files                        | audio     | Audios     |
  
 @Smoke @Automatable
 Scenario Outline: Delete a file of <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Delete"
   And taps the "Delete" button
   Then the <type> file is deleted from Tella
   And the message "File deleted successfully" appears
   
   Examples:
     | type      | folder     |
     | image     | Images     |
     | video     | Videos     |
     | audio     | Audios     |
     | document  | Documents  |

 @ToBeAutomated
 Scenario Outline: Delete multiple files of <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps the "Checkbox" button
   And selects multiple <type> files
   And taps the options button "⋮"
   And selects the option "Delete"
   And taps the "Delete" button
   Then the <type> files are deleted from Tella
   And the message "Files deleted successfully" appears
   
   Examples:
     | type     | folder     |
     | image    | Images     |
     | video    | Videos     |
     | audio    | Audios     |
     | document | Documents  |
 
 @ToBeAutomated
 Scenario Outline: View the information of a <type> file from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" of the <type> file
   And selects the option "File information"
   Then the file information is displayed
   
   Examples:
     | type      | folder     |
     | image     | Images     |
     | video     | Videos     |
     | audio     | Audios     |
     | document  | Documents  |

 Scenario: Move a file to another existing folder
   When the user enters the folder "All Files"
   And taps the options button "⋮" of a file
   And selects the option "Move to another folder"
   And chooses the destination folder
   And taps the option "MOVE HERE"
   Then the file is moved to the selected folder
   And the message appears: "File moved successfully"

 Scenario: Move a file by creating a folder
   When the user enters the folder "All Files"
   And taps the options button "⋮" of a file
   And selects the option "Move to another folder"
   And taps the option "+"
   And enters a name for the folder: "FILE123"
   And taps the option "MOVE HERE"
   Then the file is moved to the "FILE123" folder
   And the message appears: "File moved successfully"