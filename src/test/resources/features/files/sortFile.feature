Feature: Sort Files in Tella

    Background:
        Given the user has an account on Tella
        And has logged in to Tella
        And is within one of the main folders in the "files" section

    Scenario Outline: Sort files by order type in a folder
        When the user chooses to sort the files by order <order>
        Then the files are displayed according to the specified order
        And the selected <order> order persists when re-entering the folder

        Examples:
            | order                 |
            | From newest to oldest |
            | From oldest to newest |
            | Name A-Z              |
            | Name Z-A              |

    Scenario Outline: Sort files by view type in a folder
        When the user selects the option to sort the files by view type <view>
        Then the files are displayed according to the selected order
        And the <view> view selected persists when re-entering the folder
        
        Examples:
            | view |
            | list |
            | grid |