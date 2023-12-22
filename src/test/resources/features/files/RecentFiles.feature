Feature: Opening Files from Recent Files
  
@Regression @FileOptions
Scenario Outline: Open a file <file> from the "Recent Files" section
Given that the user is unlocked in the Tella app
And the user has the "Recent Files" feature activated
And there are files within Tella
And is within the Home
When the user taps on a file <file> from the "Recent Files"
Then <Result>
And the "Recent Files" section is updated

Examples:
    | Folder      | File      | Result                                           |
    | Images      | image     | the image opens                                  |
    | Videos      | video     | the video plays                                  |
    | Audios      | audio     | it navigates to the audio player                 |
    | Documents   | document  | the option to import the file appears to open it |