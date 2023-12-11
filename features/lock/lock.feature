Feature: Lock Options
  
  Background:
    Given The user opens the app for the first time

@Smoke

Scenario: register with password
  When the user tap the "EMPEZAR" button
  And tap the "Siguiente" button until reaching the lock options
  And tap the "Contraseña" button
  And types the same password to confirm
  And tap the "Siguiente" button  
  Then A successfully registered message is displayed to the user and a link to landing page

@Smoke

Scenario: register with PIN
  When the user tap the "EMPEZAR" button
  And tap the "Siguiente" button until reaching the lock options
  And tap the "PIN" button
  And types a PIN with no less than six digits
  And tap the "Siguiente" button  
  And types the same PIN to confirm
  And tap the "Siguiente" button  
  Then A successfully registered message is displayed to the user and a link to landing page

@Smoke

Scenario: register with pattern
  When the user tap the "EMPEZAR" button
  And tap the "Siguiente" button until reaching the lock options
  And tap the "Patrón" button
  And draws a pattern with no less than six points
  And tap the "Siguiente" button  
  And draws the same pattern to confirm
  And tap the "Siguiente" button  
  Then A successfully registered message is displayed to the user and a link to landing page












