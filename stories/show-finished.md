# Feature - Show recently completed features

Tasks immediately disapear once you finish them. The best part of a todo list
is seeing those finished tasks and living the sense of accomplishment.

~~~gherkin
As a application user with a bad memory
  I would like know what I have recently accomplished
  In order to brag to my teammates and manager

  Scenario: Finishing the last task in a project changes the available menu options
    Given I have started the application
    And I have a project with one task
    When I finish that last task
    Then I should have the ability to list tasks in the menu

  Scenario: Listing tasks when there are only finished tasks
    Given I have started the application
    And I have a project with many tasks
    When I finish the last task
    And I list the tasks for that project
    Then I should see a header for the recently finished tasks that says: 'Recently finished tasks'
    And I should see a list including the finished task

  Scenario: Finishing the a task in a project with other unfinished tasks
    Given I have started the application
    And I have a project with many tasks
    When I finish a task
    And I list the tasks for that project
    Then I should see the unfinished tasks first
    And I should see a header for the recently finished tasks that says: 'Recently finished tasks'
    And I should see a list including the finished task
~~~