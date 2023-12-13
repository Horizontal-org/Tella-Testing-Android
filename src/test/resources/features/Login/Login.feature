@Smoke
Feature: As a potential client i want to interact with the mobile application

  @Login
  Scenario: The user starts the application, log in to the app.
    Given The app is loaded correctly and locked a password
    When The user click the go to tella button
    Then Home page is displayed

