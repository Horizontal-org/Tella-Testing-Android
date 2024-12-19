Feature: #Here the title is described
  Here the feature is described
  
  #Here the scenario is described
  Scenario: scenario title
    Given preconditions
    When actions
    Then validations
      
  #Here the scenario is described
  Scenario Outline: scenario title <field> <field2>
    Given preconditions
    When actions
    Then validations
    
    Examples:
      | field | field2 |
      | data  | data2  |