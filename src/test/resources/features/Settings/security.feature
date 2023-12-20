  @Security

  Feature: Security
  
  Background:
  Given the user is authenticated in the Tella application with valid credentials 123456 
  And is on the main page
    
  @Regresion @Android @Security @Lock   
  Scenario Outline: Security - Lock - password option
  When the user taps settings icon 
  And  taps "Security" option 
  And taps "Lock" option in security category
  And set security code valid 
  And tap "password" option
  And set <password> 
  And taps "next" button
  And set confirm <password>
  And taps "next" button
  Then "Your lock has been changed" message is shown

  Example:
  | password | 
  | 1234560  |

  @Regresion @Android @Security @Lock
  Scenario Outline: Security - Lock - PIN option
  When the user taps settings icon 
  And  taps "Security" option 
  And taps "Lock" option in security category
  And set security code valid 
  And taps "PIN" option
  And set <PIN> 
  And taps "next" button
  And set confirm <PIN>
  And taps "next" button
  Then "Your lock has been changed" message is shown
    
  Example:
  | PIN     | 
  | 1234560 |
  
  @Regresion @Android @Security @Lock
  Scenario: Security - lock - pattern option
  When the user taps settings icon 
  And  taps "Security" option 
  And taps "Lock" option in security category
  And set security code valid 
  And taps "pattern" option
  And set pattern 
  And taps "next" button
  And set confirm pattern
  And taps "next" button
  Then  "Your lock has been changed" message is shown

  @Smoke @Android @Security @LockTimeout
  Scenario Outline: Security - Lock Timeout 
  When the user taps settings icon 
  And taps "Security" option 
  And taps "Lock timeout" option in security category 
  And select <timeout> option 
  And taps "OK" button
  And wait <timeout> of time
  Then view screen lock 
    
  Example: 
  | timeout     |
  | immediately |
  | 1 minute    |
  | 5 minutes   |
  | 30 minutes  |
  | 1 hour      | 

  @Smoke @Android @Security @LockTimeout
  Scenario: Security - Delete after failed unlock 
  When the user taps settings icon 
  And taps "Security" option 
  And taps "Lock timeout" option in security category 
  And select "immediately" option 
  And taps "OK" button
  Then view switch in ON to option "Lock timeout" 
  
  @Smoke @Android @Security @LockTimeout
  Scenario Outline: Change the Security - Lock Timeout successfully
  When the user tap settings icon 
  And tap "Security" option 
  And tap "Lock timeout" option in security category 
  And select <timeout> option 
  And tap "OK" button
  And Go back
  And tap "Lock timeout" option in security category 
  Then the option <timeout> is selected
    
  Example: 
  | timeout     |
  | immediately |
  | 1 minute    |
  | 5 minutes   |
  | 30 minutes  |
  | 1 hour      | 

  @Smoke @Android @Security @DeleteAfterFailedUnlock
  Scenario Outline: Security - Delete after failed unlock 
  When the user taps settings icon 
  And taps "Security" option 
  And taps "Delete after failed unlock" option in security category 
  And select <attempts> option 
  And taps "OK" button
  And leaves the Tella application and opens it again	
  And set incorrect <PIN> in <attempts>
  And view the Tella application is closed and opens it again
  And sees that the configuration is set by default
  Then sees that the files have been deleted	
    
  Example:
  | attempts    | PIN |
  | 5 attempts  | 1   |
  | 10 attempts | 1   |
  | 20 attempts | 1   |

  @Smoke @Android @Security @Camouflage
  Scenario Outline: Security - camouflage - change camuflaje method - change name and icon 
  When the user tap settings icon 
  And taps "Security" option 
  And taps "Camouflage" option in security category 
  And set security code valid 
  And taps "Change camuflaje method" option
  And taps "Change name and icon" option 
  And select <icon> option 
  And taps "next" option 
  And taps exit Tella option 
  And view the <message>
  And view change Tella <icon> 
 	
  Example:
    | icon           | message                                                                   |                                                                                                      | 
    | iCamara        | please wait.you will return to your device´s home screen in a few seconds |
    | Selfie Cam     | please wait.you will return to your device´s home screen in a few seconds |
    | Snap Camera    | please wait.you will return to your device´s home screen in a few seconds |
    | Mi camera      | please wait.you will return to your device´s home screen in a few seconds |
    | Calculate      | please wait.you will return to your device´s home screen in a few seconds |
    | Calculate Plus | please wait.you will return to your device´s home screen in a few seconds |
    | iCalculator    | please wait.you will return to your device´s home screen in a few seconds |
    | Calculator     | please wait.you will return to your device´s home screen in a few seconds |
    | Weather        | please wait.you will return to your device´s home screen in a few seconds |
    | EasyWaether    | please wait.you will return to your device´s home screen in a few seconds |
    | SunnyDay       | please wait.you will return to your device´s home screen in a few seconds |
    | Forecast       | please wait.you will return to your device´s home screen in a few seconds |
    | GameStation    | please wait.you will return to your device´s home screen in a few seconds |
    | PlayNow        | please wait.you will return to your device´s home screen in a few seconds |
    | Game Launcher  | please wait.you will return to your device´s home screen in a few seconds |
    | Clock          | please wait.you will return to your device´s home screen in a few seconds |
    | Jewel Dash     | please wait.you will return to your device´s home screen in a few seconds |
    | Time           | please wait.you will return to your device´s home screen in a few seconds |
    | StopWatch      | please wait.you will return to your device´s home screen in a few seconds |
    | Watch          | please wait.you will return to your device´s home screen in a few seconds |
    | Workout        | please wait.you will return to your device´s home screen in a few seconds |
    | Fitness Life   | please wait.you will return to your device´s home screen in a few seconds |
    | Health         | please wait.you will return to your device´s home screen in a few seconds |
    | Period Tracker | please wait.you will return to your device´s home screen in a few seconds |
    | Music          | please wait.you will return to your device´s home screen in a few seconds |
    | Dictionary     | please wait.you will return to your device´s home screen in a few seconds |
    | Plant Care     | please wait.you will return to your device´s home screen in a few seconds |
    | Astrology      | please wait.you will return to your device´s home screen in a few seconds |

 @Smoke @Android @Security @Camouflage
 Scenario Outline: Security - camouflage -  change camuflaje method - hide behind a calculator
    When the user tap settings icon 
    And taps "Security" option 
    And verify "PIN" is selecter in lock option 
    And taps "Camouflage" option in security category 
    And set security code valid 
    And taps "change camuflaje method" option
    And taps "hide behind a calculator" option 
    And select <calculator> option 
    And taps exit Tella option 
    And view the <message>
    And view change Tella <icon>  
    
    Example:
      | Calculator    | message                                                                   | 
      | Calculator_1  | please wait.you will return to your device´s home screen in a few seconds |
      | Calculator_2  | please wait.you will return to your device´s home screen in a few seconds | 
      | Calculator_3  | please wait.you will return to your device´s home screen in a few seconds | 
      | Calculator_4  | please wait.you will return to your device´s home screen in a few seconds |

 @Smoke @Android @Security @Camouflage
 Scenario: Security - camouflage - remove camouflage
    When the user tap settings icon 
    And taps "Security" option 
    And taps "Camouflage" option in security category 
    And set security code valid 
    And taps "Remove camouflage" option
    And view message "Removing camouflage"
    Then view change Tella icon default

 @Smoke @Android @Security @QuickDelete
 Scenario: Security - Quick delete - delete file
    When the user tap settings icon 
    And taps "Security" option 
    And taps switch in "Quick delete" option in security category 
    And select check box "Delete files" 
    And go to Tella home page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message "Quick Delete mode activation"
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that files were deleted

 @Smoke @Android @Security @QuickDelete
 Scenario: Security - Quick delete - Delete draft and submitted forms
    When the user tap settings icon 
    And taps "Security" option 
    And taps switch in "Quick delete" option in security category 
    And select check box “Delete draft and submitted forms” 
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that draft and submitted forms were deleted

 @Smoke @Android @Security @QuickDelete
 Scenario: Security - Quick delete - Delete server settings
    When the user tap settings icon 
    And taps "Security" option 
    And taps switch in "Quick delete" option in security category 
    And select check box “Delete server settings” 
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that server settings were deleted 
 
 @Smoke @Android @Security @QuickDelete
 Scenario: Security - Quick delete - Delete Tella
    When the user tap settings icon 
    And taps "Security" option 
    And taps switch in "Quick delete" option in security category
    And select check box “Delete Tella” 
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    Then view uninstall message 

 @Smoke @Android @Security @QuickDelete
 Scenario Outline: Security - Quick delete - help info 
    When the user tap settings icon 
    And taps "Security" option 
    And taps "Quick delete" option in security category
    And taps icon help in <deleteOption> 
    Then view the help info with <message>

  Example:
    | deleteOption                     | message                                                                                                                                          |
    | Delete files                     | Delete all the files stored in Tella                                                                                                             |
    | Delete draft and submitted forms | Delete all draft and submitted forms                                                                                                             |
    | Delete server settings           | Delete your connections to servers and all                                                                                                       |
    | Delete Tella                     | Delete the app and all the data it contains. You will be asked "Do you want to uninstall this app?" Unless you confirm,Tella will not be delete. |

 @Smoke @Android @Security @PreserveMetadata
 Scenario: Security - Preserve metadata when importing 
   When the user tap settings icon 
   And tap "Security" option 
   And view "Preserve metadata when importing"
   And taps switch in ON to option "Preserve metadata when importing"
   Then the sistem activated the "Preserve metadata when importing" option

  @Smoke @Android @Security @CameraSilentMode
  Scenario: Security - Camera silent mode
   When the user tap settings icon 
   And tap "Security" option 
   And view "Camera silent mode"
   And taps switch in ON to option "Camera silent mode" 
   And go to Tella home page 
   And taps camera button 
   And take photo 
   Then the camera did not make the sound 

 @Smoke @Android @Security @ScreenSecurity
 Scenario: Security - Screen security  
   When the user tap settings icon 
   And tap "security" option 
   And view "Screen security"
   And taps switch in ON to option "Screen security"
   And go to Tella home page 
   And take screenshot 
   Then view warning permissions 