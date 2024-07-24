Feature: jj

Scenario Outline: Delete entity in outbox
    Given the user has an entity in outbox
    When the user selects the option <Option Report>
    And the user taps the "⁝" button 
    
    Examples: 
      | Option Report   |
      | hola            |
      | chau            |