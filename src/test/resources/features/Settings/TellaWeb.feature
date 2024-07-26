@TellaWeb @Regression
Feature: Tella Web
  
Background:
  Given the user is authenticated in the Tella application with valid credentials
	And the user is in Tella home page
  And the user is connected to the Tella Web server

@ToBeAutomated @Smoke
Scenario Outline: Submit report with <Select files>
When the user taps the "Reports" connection
And taps the New report
And completes the Title and the Description
And taps the "+" button
And selects the option <Select files> 
And selects files and presses the "verification" icon
And presses "Submit"
And sees the file being uploaded
Then the approval message "your report is available Outbox" appears

Examples: 
|Select files           |
|Select from Tella files|
|Select from your device|


@NoCandidate @Smoke
Scenario: Submit new report with photo
When the user taps the "Reports" connection
And taps the New report
And completes the Title and the Description
And taps the "+" button
And selects the option Take photo with camera
And presses the "rec" icon
And presses "Submit" 
And sees the file being uploaded
Then the approval message "your report is available Outbox" appears 


@NoCandidate  @Smoke
Scenario Outline: Submit new report with <recording>
When the user taps the "Reports" connection
And taps the New report
And completes the Title and the Description
And taps the "+" button
And selects the option <Select files>
And presses the "rec" and "stop" icon
And presses "Submit"
And sees the file being uploaded
Then the approval message "your report is available Outbox" appears

Examples:
|recording|  Select files             |
|video    |  Take photo with camera   |
|audio    |  Record audio             |


@ToBeAutomated  @Smoke
Scenario: Delete report during sending
When the user taps the "Reports" connection 
And taps the New report
And completes the Title and the Description
And taps the "+" button
And selects the option Select from Tella files
And selects files and presses the "verification" icon
And presses "Submit"
And sees the file being uploaded and presses Pause
And goes back 
And presses Outbox
And presses the "Menu" icon of a Outbox report
And selects Delete
And confirms the Delete option
Then the approval message "File has been deleted" appears


@ToBeAutomated  @Smoke
Scenario: Delete draf
Given: the user has a report in the Draft folder
When the user taps the "Reports" connection
And presses the "Menu" icon of a Draft report
And selects Delete 
And confirms the Delete option
Then the approval message "File has been deleted" appears



@ToBeAutomated  @Smoke
Scenario Outline: Save report to <option>
When the user taps the "Reports" connection
And taps the New report
And completes the Title and the Description
And taps the "+" button
And selects the option Select from Tella files
And selects files and presses the "verification" icon
And presses <option> icon
Then the approval message <message> appears

Examples:
|option  |  message                                                               |
|Save    |  The report was saved as a draft                                       |
|Clock   |  The report was saved to your Outbox. You can submit it when you ready |


@ToBeAutomated  @Smoke
Scenario: Send a report from Draft
Given:the user has a report in the Draft folder
When presses the "Menu" icon of a Draft report
And selects Edit draft 
And taps Send
Then the approval message "your report is available Outbox" appears


@ToBeAutomated  @Smoke
Scenario: Send a report from Outbox
Given:the user has a report in the Outbox folder
When the user taps the "Reports" connection
And selects the option Outbox
And presses the "Menu" icon of a Outbox report
And selects View 
And taps Resume
Then the approval message "your report is available Outbox" appears


@ToBeAutomated  @Smoke
Scenario: Activate Auto-report
When the user taps the settings icon
And selects the "Servers" option
And selects the "Project created in Tella Web"
And selects Edit 
And selects Auto-report
And sees that the color has changed to green, indicating it is activated
And presses the "Save" icon
Then the approval message "Served updated" appears

@NoCandidate  @Smoke
Scenario: Take photo or video with Auto-report activated
Given the Auto-report option is activated
When the user presses the camera button
And presses the take a photo button
Then the approval message "The photo(s)/video you took has been automatically uploaded as a report" appears


@ToBeAutomated  @Smoke
Scenario: Activate Auto-delete
Given the Auto-report option is activated
When the user taps the settings icon
And selects the "Servers" option
And selects the "Project created in Tella Web"
And selects Edit 
And selects Auto-delete
And sees that the color has changed to green, indicating it is activated
And presses the "Save" icon
Then the approval message "Served updated" appears

@NoCandidate  @Smoke
Scenario: Take photo or video with Auto-delete activated
Given the Auto-report and Auto-report option is activated
When the user presses the camera button
And presses the take a photo button
Then the approval message "The photo/video you took has been uploaded as a report and automatically deleted" appears


@ToBeAutomated  @Smoke
Scenario: Activate Background upload
When the user taps the settings icon
And selects the "Servers" option
And selects the "Project created in Tella Web"
And selects Edit 
And selects Background upload
And sees that the color has changed to green, indicating it is activated
And presses the "Save" icon
Then the approval message "Served updated" appears

@ToBeAutomated  @Smoke
Scenario: Send report with Background upload activated
Given the Background upload option is activated
And The user taps the "Reports" connection
And taps the New report
And completes the Title and the Description
And taps the "+" button
And selects the option Select from Tella files
And selects files and presses the "verification" icon
And presses "Submit"
And exit and enter the application
And enter password 
And taps the "Reports" connection
And taps Submitted 
Then sees the sent report


@ToBeAutomated @Smoke
Scenario: Send a report with video while the internet is desconnecting
Given the Auto-report option is activated and the user has a report with video 
When taps Submit 
And sees the file being uploaded
And disconnect and connect internet from your cell phone
And go back 
And presses Outbox
And presses "Menu" icon
And select View 
And presses Resume
And sees the file being uploaded
Then the approval message "your report is available Outbox" 


Scenario: Submit report - 1000 characters in Description
When the user taps the "Reports" connection
And taps the New report
And completes the Title and the Description with 1000 characters
And presses "Submit"
Then the approval message "your report is available Outbox" appears