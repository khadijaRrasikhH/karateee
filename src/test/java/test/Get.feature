Feature:Get API Demo
  Background:
* url 'https://reqres.in/api'
* header Accept = 'application/json'
 # simple test Request
  Scenario: Get demo one
    Given   path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    #  Get with Background
  Scenario: Get demo two
    Given    path '/users/2'
    When method GET
    Then status 200
    And print response
    # Get with Path and Param
  Scenario: Get demo three
    Given    path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
 # Get with Assertion
  Scenario: Get demo four
    Given    path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And  match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match $.data[4].last_name == 'Edwards'
