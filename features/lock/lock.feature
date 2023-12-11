Feature: Lock Options
  
  Background:
    Given The user opens the app for the first time

@Smoke

Scenario: register with password
  When the user taps the "EMPEZAR" button
  And the user taps the "Siguiente" button until reaching the lock options
  And the user taps the "Contraseña" button
  And the user types the same password to confirm
  And the user taps the "Siguiente" button  
  Then A successfully registered message is displayed to the user and a link to landing page





