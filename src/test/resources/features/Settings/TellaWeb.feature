@TellaWeb @Smoke
Feature: Tella Web
  
Background:
  Given the user is authenticated in the Tella application with valid credentials
	And the user is in Tella home page
  And the user is connected to the Tella Web server

@ToBeAutomated
Scenario Outline: Submit report with <Select files>
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option <Select files> 
And select files and presses the "verification" icon
And taps Submit 
And sees the file being uploaded
Then the approval message "your report is available Outbox" 

Examples: 
|Select files           |
|Select from Tella files|
|Select from your device|


@NoCandidate
Scenario: Submit new report with photo
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Take photo with camera
And presses the "rec" icon
And taps Submit 
And sees the file being uploaded
Then the approval message "your report is available Outbox" 


@NoCandidate
Scenario Outline: Submit new report with <recording>
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option <Select files>
And presses the "rec" and "stop" icon
And taps Submit 
And sees the file being uploaded
Then the approval message "your report is available Outbox" 

Examples:
|recording|  Select files             |
|video    |  Take photo with camera   |
|audio    |  Record audio             |


@ToBeAutomated
Scenario: Delete report during sending
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Select from Tella files
And select files and presses the "verification" icon
And taps Submit 
And sees the file being uploaded and presses Pause
And go back 
And presses Outbox
And presses the "Menu" icon of a Outbox report
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"

@ToBeAutomated
Scenario: Delete draf
Given: the user has a report in the Draft folder
When the user taps the Report folder
And presses the "Menu" icon of a Draft report
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"


@ToBeAutomated
Scenario Outline: Delete <Option Report>
Given: the user has a report in the Folder <Option Report>
When the user taps the Report Folder
And selects the option <Option Report>
And presses the file "Menu" icon of a <Option Report> report
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"

Examples: 
|Option Report|
|Outbox       |
|Submitted    |


@ToBeAutomated
Scenario Outline: Save a report from <option>
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Select from Tella files
And select files and presses the "verification" icon
And presses <option> icon
Then the approval message <message> 

Examples:
|option  |  message                                                               |
|Save    |  The report was saved as a draft                                       |
|Clock   |  The report was saved to your Outbox. You can submit it when you ready |


@ToBeAutomated
Scenario: Send a report from Draft
Given:the user has a report in the Draft folder
When presses the "Menu" icon of a Draft report
And select Edit draft 
And taps Send
Then the approval message "your report is available Outbox" 


@ToBeAutomated
Scenario: Send a report from Outbox
Given:the user has a report in the Outbox folder
When the user taps the Report Folder
And selects the option Outbox
And presses the "Menu" icon of a Outbox report
And select View 
And taps Resume
Then the approval message "your report is available Outbox" 

@ToBeAutomated
Scenario: Internet desconnection during report sending
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Select from Tella files 
And select files and presses the "verification" icon
And taps Submit 
And sees the file being uploaded
And disconnect and connect internet from your cell phone
And go back 
And presses Outbox
And presses "Menu" icon
And select View 
And presses Resume
And sees the file being uploaded
Then the approval message "your report is available Outbox" 


@ToBeAutomated
Scenario: Activate Auto-report
When the user taps the settings icon
And selects the "Servers" option
And selects the "Project created in Tella Web"
And select Edit 
And select Auto-report
And sees that the color has changed to green, indicating it is activated
And presses "Save" icon
Then the approval message "Served updated" 

@NoCandidate
Scenario: Take photo or video with Auto-report activated
Given the Auto-report option is activated
When the user presses the camera button
And presses the take a photo button
Then the approval message "The photo(s)/video you took has been automatically uploaded as a report"


@ToBeAutomated
Scenario: Activate Auto-delete
Given the Auto-report option is activated
When the user taps the settings icon
And selects the "Servers" option
And selects the "Project created in Tella Web"
And select Edit 
And select Auto-delete
And sees that the color has changed to green, indicating it is activated
And presses "Save" icon
Then the approval message "Served updated" 

@NoCandidate
Scenario: Take photo or video with Auto-delete activated
Given the Auto-report and Auto-report option is activated
When the user presses the camera button
And presses the take a photo button
Then the approval message "The photo/video you took has been uploaded as a report and automatically deleted"


@ToBeAutomated
Scenario: Activate Background upload
When the user taps the settings icon
And selects the "Servers" option
And selects the "Project created in Tella Web"
And select Edit 
And select Background upload
And sees that the color has changed to green, indicating it is activated
And presses "Save" icon
Then the approval message "Served updated" 





And go to Tella home page
And taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Select from Tella files
And select files and presses the "verification" icon
And taps Submit 
And exit and enter the application
And enter password 
And taps the Report 
And taps Submitted 
Then sees the sent report


Scenario: Submit report - 1000 characters in Description
When the user taps the Report 
And taps the New report
And completes the Title and the Description with 1000 characters
And taps Submit 
Then the approval message "your report is available Outbox" 