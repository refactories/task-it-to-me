# Feature - Friendlier menus

Currently when a user tries to list projects before any have been
created, it balks with a message. What we would like instead is to only
show commands that can be executed.

This is an opportunity to do some refactoring around extracting the command related
data into a separate structure. Also, there is a whole bunch of null handling that
goes away with this rework.

~~~gherkin
In order for the application to feel less clunky
  As a application user
  I would like menu items only to show up when they are appropriate

  Scenario: When app starts
    Given I have started the application
    Then I should see the command 'a' for adding projects
    And I should see the command 'q' for quitting the app
    And I should not see commands 'ls', 'd' or 'e'

  Scenario: When project has been created
    Given I have started the application
    And I have created a project
    Then I should see the menu includes 'ls', 'd' and 'e' commands
    And I should still see the 'a' and 'q' commands

  Scenario: When all projects have been deleted
    Given I have started the application
    And I have created a project
    When I delete the project
    Then I should sse the commands 'a' and 'q'
    And I should not see the commands 'ls', 'd' or 'e'

  Scenario: When editing an empty project
    Given I have started the application
    And I have created a project
    When I edit the project
    Then I should see the commands 'c', 'a', 'b' and 'q'
    And I should not see the commands 'ls', 'd', 'e' or 'f'

  Scenario: When editing a project with task(s)
    Given I have started the application
    And I have created a project
    And I am editing the project
    When I create a new task
    Then I should see the commands 'ls', 'd', 'e' and 'f'
    And I should see the commands 'c', 'a', 'b' and 'q'

  Scenario: When deleting the last task in a project
    Given I have started the application
    And I have created a project with one task
    When I delete the last task
    Then I should see the commands 'c', 'a', 'b' and 'q'
    And I should not see the commands 'ls', 'd', 'e' or 'f'

  Scenario: When finishing the last task in a project
    Given I have started the application
    And I have created a project with one task
    When I finish the last task
    Then I should see the commands 'c', 'a', 'b' and 'q'
    And I should not see the commands 'ls', 'd', 'e' or 'f'
~~~
