@TellaWeb
Feature: Tella Web
  
Background:
  Given the user is authenticated in the Tella application with valid credentials 654321
	And the user is in Tella home page

Scenario Outline: Submit new report
When the user taps the Report 
And the user taps the New report
And the user completes the Title and the Description
And the user presses the "add" icon
And the user selects the <Select files> option
And the user select files and presses the "verification" icon
And the user taps Submit 
And the user sees the file being uploaded
Then the approval message "your report is available Outbox" 

Examples: 
|Select files           |
|Select from Tella files|
|Select from your device|


Scenario: Submit new report with photo
When the user taps the Report 
And the user taps the New report
And the user completes the Title and the Description
And the user presses the "add" icon
And the user selects Take photo with camera
And the user presses the "rec" icon
And the user taps Submit 
And the user sees the file being uploaded
Then the approval message "your report is available Outbox" 


Scenario: Submit new report with video
When the user taps the Report 
And the user taps the New report
And the user completes the Title and the Description
And the user presses the "add" icon
And the user selects Take photo with camera
And the user selects video
And the user presses the "rec" and "stop" icon
And the user taps Submit 
And the user sees the file being uploaded
Then the approval message "your report is available Outbox" 


Scenario: Delete report in Outbox
When the user taps the Report 
And the user taps the New report
And the user completes the Title and the Description
And the user presses the "add" icon
And the user selects the Select from Tella files option
And the user select files and presses the "verification" icon
And the user taps Submit 
And the user sees the file being uploaded and presses Pause
And go back 
And the user presses Outbox
And the user presses "menu" icon
And the user select Delete
And confirms the Delete option
Then the approval message "File has been deleted"


Scenario Outline: Delete <Option Report>
When the user presses <Option Report>
And the select file
And user presses "menu" icon
And the user select Delete
And confirms the Delete option
Then the approval message "File has been deleted"

Examples: 
|Option Report|
|Draft        |
|Submitted    |


Scenario: Save report to Draft and send later
When the user taps the Report 
And the user taps the New report
And the user completes the Title and the Description
And the user presses "Save" icon
And the approval message "The report was saved as a draft"
And go back 
And the user presses Draft
And the user presses "menu" icon
And the user select Edit draft
And the user taps send
Then the approval message "your report is available Outbox" 



Scenario: Send report of a waiting file
When the user taps the Report 
And the user taps the New report
And the user completes the Title and the Description
And the user presses "clock" icon
And the approval message "The report was saved to your Outbox. You can submit it when you ready"
And the user presses Outbox 
And the user select file
And the user presses "menu" icon
And the user select view 
And the user taps resume
Then the approval message "your report is available Outbox" 


