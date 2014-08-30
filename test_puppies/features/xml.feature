Feature: using xml in my cukes

  Scenario: find the number of sitcoms and dramas
    When I open my shows xml
    Then I should see 2 sitcoms
    And I should see 1 drama

  Scenario: find a phone number from a collection
    Given I have a phone book:
      | name   | phone    |  
      | Cheezy | 525-5309 |  
      | Sneezy | 123-4567 |  
      | Wheezy | 908-9999 |  
      | Sleazy | 666-6666 |  
      | Freezy | 333-3333 |  
    When I look up the phone number for "Sneezy"
    Then I should see the phone number "123-4567"