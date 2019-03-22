Feature: Demo for Karate API tests.

  Scenario: Check simple value
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And match response.total == 12

  Scenario: Check array inside object response
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And match response.data.[*].id contains [4, 5, 6]

  Scenario: Check array type of fields
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And match each response.data.[*] == {id: '#number', first_name: '#string', last_name: '#string', avatar: '#string'}