Feature: Test Demo Api
  Scenario: Simple Get Api
    Given  url 'https://reqres.in/api/users?page=2'
    When method Get
    Then status 200
    And print response