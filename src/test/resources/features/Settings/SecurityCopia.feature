@Regression @Security
Feature: Security

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the category Security 
 
  #Linea 36 - linea 228 del feature Security 
  @Smoke @SmokeManual @LockTimeout
  Scenario Outline: Security - Lock Timeout
    When the user clicks the "Lock timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    And wait <timeout> of time
    Then view screen lock

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |
      
      
  #Linea 98 - linea 274 del feature Security     
   @Smoke @Camouflage @SmokeManual
  Scenario Outline: Security - camouflage - change camuflaje method - change name and icon 
    When the user clicks the "Camouflage" option
    And The user enter the password <password>
    And select "CHANGE NAME AND ICON" option
    And select icon <icon> option
    And tap the next button
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <icon>

    Examples:
      | password | icon       | message                                                                     |
      | 123456   | MiCamera   | Please wait. You will return to your device's home screen in a few seconds. |
      | 123456   | Calculator | Please wait. You will return to your device's home screen in a few seconds. | 
      
 
  #Linea 133 - linea 308 del feature Security     
  @Smoke @QuickDelete @SmokeManual
  Scenario Outline: Security - Quick delete - <quickDeleteCheck>
    When the switch is toggled on in the "Quick delete" option
    And select the checkbox "<quickDeleteCheck>"
    And go to the Tella home page
    And verify that the "DELETE" slide button is present
    And tap the "DELETE" slide button
    And view the counter message "Quick Delete mode activation"
    And wait for the counter to finish
    And open the Tella application again
    And set a valid security code
    Then verify that the files were deleted
  
  Examples:
    | quickDeleteCheck                 |
    | Delete files                     |
    | Delete draft and submitted forms |
    | Delete server settings           |  
    
  
  #Lineas 115 - linea 290 la diferencia sola es como esta escrita camuflage 
   @Smoke @Camouflage @SmokeManual 
  Scenario Outline: Security - camouflage - change camuflage method - hide behind a calculator
    When the PIN is selected in lock option
    And the user clicks the "Camouflage" option
    And enter the valid PIN
    And select "HIDE BEHIND A CALCULATOR APP" option
    And select <calculator> option
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <calculator>

    Examples:
      | calculator   | message                                                                     |
      | Calculator_1 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_2 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_3 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_4 | Please wait. You will return to your device's home screen in a few seconds. | 
   

        