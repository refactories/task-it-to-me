# Feature - Show the right menu after each command

Currently, the main Projects menu is only printed once when the
application is first run. The individual project menu is run when a
project starts to be edited, but not again afterwards. The change we
would like to make is to display the current menu after each command
completes.

~~~gherkin
  In order to not get lost and forget what commands are available
    As a application user
    I want the current menu to be printed after each command is completed

    Scenario: When working in the top level projects area
      Given that I have started the application
      When I complete any command (with our without success)
      Then I should see the projects menu printed

    Scenario: When working in the individual project menu area
      Given that I have started the application
      And I have started editing a project
      When I complete any command (with or without success)
      Then I should see the individual edit project menu printed
~~~