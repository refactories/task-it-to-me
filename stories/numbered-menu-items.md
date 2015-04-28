# Feature - Numbered menu items, less typing!

Currently when a user selects a project or task to edit, delete, etc,
the prompt asks for the full name of the task or project. It is
unforgiving about spaces or capitalization causing users to complain. We
would like to make the application look more like a list with numbers
that can be used to identify the project or task. No number should be
duplicated. The behavior of selecting an item by name should still work as it
currently does, for those few users who love typing the full name.

When a project is deleted, or a task is deleted/finished, the
numbering should be updated to reflect the new full list.

~~~gherkin
As a application user who hates typing
  I would like menu to select projects and tasks by numbered id
  In order to be more efficient and not make errors

  Scenario: Listing projects
    Given I started the application
    And I have created 3 projects
    When I list the projects
    Then I should see a number in front of each project name
    And the number should be highlighted white
    And the project name should be in pink

  Scenario: Adding projects
    Given I have started the application
    When I create a project name 'get lunch'
    Then I should see success message: "Created project: 1. 'get lunch'"
    And the number should be highlighted white
    And the project name should be in pink

  Scenario: Listing tasks
    Given I started the application
    And I have a project with three tasks
    When I list the tasks
    Then I should see a number in front of each task name
    And the number should be highlighted white
    And the task name should be in pink

  Scenario: Adding projects
    Given I have started the application
    And I am editing a project
    When I create a task name 'get lunch'
    Then I should see success message: "Created task: 1. 'get lunch'"
    And the number should be highlighted white
    And the project name should be in pink
~~~