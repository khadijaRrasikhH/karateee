Feature: config demo
  Background:
  * url 'https://reqres.in/api'
  * header Accept = 'application/json'

  Scenario: Get demo one
    Given   path '/users?page=2'
    When method GET
    Then status 200