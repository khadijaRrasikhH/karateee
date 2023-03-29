Feature: Post API Request
    #backgraound run before all scenario
  Background:
   * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # simple Post request
  Scenario: post demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "khadija","job": "Tester"}
    When method POST
    Then status 201
    And print response

    # post with Background
  Scenario: Post demo 2
    Given path '/users'
    And request {"name": "khadija","job": "Tester"}
    When method POST
    Then status 201
    And print response

    # post with Assertions
  Scenario: Post demo 3
    Given path '/users'
    And request {"name": "khadija","job": "Tester"}
    When method POST
    Then status 201
    And match response == {"name": "khadija", "job": "Tester", "id": "#string", "createdAt": "#ignore"}
    And print response

     # post with read response from file
  Scenario: Post demo 4
    Given path '/users'
    And request {"name": "khadija","job": "Tester"}
    When method POST
    Then status 201
    And match $ == expectedOutput
   And print response

#     # post with read response from file
 Scenario: Post demo 5
    Given path '/users'
    And def projectPath = karate.properties ['User.dir']
    And print projectPath
    And def filePath = projectPath + '/src/test/data/request1.json'
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1
    When method POST
    Then status 201
   And print response
 #Post with read response
  Scenario: Post demo 6
    Given path '/users'
    And def reqBody = read("request1.json")
    And set reqBody.job = 'engineer'
    And request reqBody
    When method POST
    Then status 201
   And print response