Feature: Lock Options
  
  Background:
    Given The user opens the app for the first time

@Smoke

Scenario: register with password
  When the user tap the "EMPEZAR" button
  And the user tap the "Siguiente" button until reaching the lock options
  And the user tap the "Contraseña" button
  And the user types the same password to confirm
  And the user tap the "Siguiente" button  
  Then A successfully registered message is displayed to the user and a link to landing page

@Smoke

Scenario: register with PIN
  When the user tap the "EMPEZAR" button
  And the user tap the "Siguiente" button until reaching the lock options
  And the user tap the "PIN" button
  And the user types a PIN with no less than six digits
  And the user tap the "Siguiente" button  
  And the user types the same PIN to confirm
  And the user tap the "Siguiente" button  
  Then A successfully registered message is displayed to the user and a link to landing page












