Feature: About and Help 
  
Background:
  Given the user is authenticated in the Tella application with valid credentials 
  And is on the main page 

@Smoke @AboutAndHelp
Scenario: about and help - view options 
  When the user tap settings icon 
  And tap the "about and help" 
  Then view  the icon Tella and the version
  And view a list options
  
@Smoke @AboutAndHelp
Scenario: about and help - go to FAQ page 
  When the user tap setting icon 
  And tap the "about and help" 
  And tap the FAQ option  
  Then is redirected to the Tella documentation Website
  
@Smoke @AboutAndHelp  
Scenario: about and help - contact us 
  When the user tap setting icon  
  And tap the "about and help" 
  And tap the contact us option 
  Then is redirected to the email
  
@Smoke @AboutAndHelp
Scenario: about and help - Privacy policy 
  When the user tap setting icon 
  And tap the "about and help" 
  And tap the Privacy policy option  
  Then is redirected to the Tella- Privacy policy Website 