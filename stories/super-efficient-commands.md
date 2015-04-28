# Feature - Super efficient commands

The app is pretty fast, but people want all sorts of efficiencies. For example,
the app creator explained that there was no reason to wait an extra response
cycle to enter a task name after entering the command code, why not be able to
enter it all at once.

So, that's what we need to do now:(

~~~gherkin
In order for increase efficiency
  As a application user
  I would like to enter the menu command and then the data it requires in the same request cycle

  Scenario: Creating a project with the all-in-one command
    Given I have started the application
    And I have signed in
    When I type 'a gerbil care'
    And I list the projects
    Then I should see a new project 'gerbil care' has been created

  Scenario: Editing a project with the all-in-one
    Given I have started the application
    And I have signed in
    And I have a project called 'gerbil care'
    When I type 'e gerbil care'
    Then I should see be editing the 'gerbil care' project with its menu

  Scenario: Deleting a project with the all-in-one
    Given I have started the application
    And I have signed in
    And I have a project called 'gerbil care' and one other project
    When I type 'd gerbil care'
    And I list the projects
    Then I should see that 'gerbil care' project has been deleted

  Scenario: Renaming a project with the all-in-one
    Given I have started the application
    And I have signed in
    And I have am editing a project called 'gerbil care'
    When I type 'c hamster care'
    Then I should see that 'gerbil care' project has been renamed to 'hamster care'

  Scenario: Adding a task with the all-in-one
    Given I have started the application
    And I have signed in
    And I have am editing a project
    When I type 'a change water'
    Then I should see a new task 'change water' has been added

  Scenario: Renaming a task with the all-in-one (almost)
    Given I have started the application
    And I have signed in
    And I have am editing a project
    And there is a task called 'change water'
    When I type 'e change water'
    And I am prompted and enter a new name 'refill water'
    Then I should see the task 'change water' has been changed to 'refill water'

  Scenario: Deleting a task with the all-in-one
    Given I have started the application
    And I have signed in
    And I have am editing a project
    And there is a task called 'change water' and one other
    When I type 'd change water'
    And I list tasks
    Then I should see the task 'change water' has been deleted

  Scenario: Finishing a task with the all-in-one
    Given I have started the application
    And I have signed in
    And I have am editing a project
    And there is a task called 'change water'
    When I type 'f change water'
    And I list tasks
    Then I should see the task 'change water' has been finished
~~~