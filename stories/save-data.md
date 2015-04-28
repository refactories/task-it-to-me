# Feature - Persist data between application runs

Data should be saved to a file so that if the application quits or even
if the whole computer dies, the data is available the next time the application
is run.

~~~gherkin
As a application user
  I would like my data to be persisted between runs
  In order to not loose my train of thought when the computer dies

  Scenario: Starting and stopping the app
    Given I have started the application
    And I have added a number of projects and tasks
    When I quit the app
    And then I start it again
    Then I should see all my data as I left it
~~~

Note: you should make sure that when tests run it doesn't destroy the actual
data file.

