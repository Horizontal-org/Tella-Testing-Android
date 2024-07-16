@TellaWeb
Feature: Tella Web
  
Background:
  Given the user is authenticated in the Tella application with valid credentials 654321
	And the user is in Tella home page

Scenario Outline: Submit new report
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


Scenario: Delete report in Outbox
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Select from Tella files
And select files and presses the "verification" icon
And taps Submit 
And the user sees the file being uploaded and presses Pause
And go back 
And presses Outbox
And presses "Menu" icon
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"


Scenario Outline: Delete <Option Report>
When the user presses <Option Report>
And select file
And presses "Menu" icon
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"

Examples: 
|Option Report|
|Draft        |
|Submitted    |


Scenario: Save report to Draft and send later
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses "Save" icon
And the approval message "The report was saved as a draft"
And go back 
And presses Draft
And presses "Menu" icon
And select Edit draft
And taps Send
Then the approval message "your report is available Outbox" 



Scenario: Send report of a waiting file
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses "Clock" icon
And the approval message "The report was saved to your Outbox. You can submit it when you ready"
And presses Outbox 
And select file
And presses "Menu" icon
And select View 
And taps Resume
Then the approval message "your report is available Outbox" 


