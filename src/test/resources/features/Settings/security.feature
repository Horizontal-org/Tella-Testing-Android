Feature: Security
  
  Background:
    Given the user is authenticated in the Tella application with valid credentials 
    And is on the main page
    
  @Smoke @Security   
  Scenario Outline: Security - Lock - password option
    When the user tap settings icon 
    And  tap "security" option 
    And tap "lock" option in security category
    And set security code valid 
    And tap "password" option
    And set <password> 
    And tab "next" button
    And set confirm <password>
    And tab "next" button
    Then view the screen confirmation successful

  Example:
    | password | 
    | 1234560  |

  @Smoke @Security 
  Scenario Outline: Security - Lock - PIN option
    When the user tap settings icon 
    And  tap "security" option 
    And tap "lock" option in security category
    And set security code valid 
    And tap "PIN" option
    And set <PIN> 
    And tab "next" button
    And set confirm <PIN>
    And tab "next" button
    Then view the screen confirmation successful
    
  Example:
    | PIN     | 
    | 1234560 |
  
  @Smoke @Security 
  Scenario: Security - lock - pattern option
    When the user tap settings icon 
    And  tap "security" option 
    And tap "lock" option in security category
    And set security code valid 
    And tap "pattern" option
    And set pattern 
    And tab "next" button
    And set confirm pattern
    And tab "next" button
    Then view the screen confirmation successful 

  @Smoke @Security 
  Scenario Outline: Security - Lock Timeout 
    When the user tap settings icon 
    And tap "security" option 
    And tap "lock timeout" option in security category 
    And select <timeout> option 
    And tap "OK" button
    And wait <timeout> of time
    Then view screen lock 
    
  Example: 
    | timeout     |
    | immediately |
    | 1 minute    |
    | 5 minutes   |
    | 30 minutes  |
    | 1 hour      | 

  @Smoke @Security 
  Scenario Outline: Security - Delete after failed unlock 
    When the user tap settings icon 
    And tap "security" option 
    And tap "delete after failed unlock" option in security category 
    And select <attempts> option 
    And tap "OK" button
    And leaves the Tella application and opens it again	
    And set incorrect in <attempts>
    And view the Tella application is closed and opens it again
    And sees that the configuration is set by default
    Then sees that the files have been deleted	
    
  Example:
    | attempts    |
    | 5 attempts  |
    | 10 attempts |
    | 20 attempts |