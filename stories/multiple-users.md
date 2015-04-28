# Feature - Multiple users per app

The team works a sustainable pace, leaving their computers at work and pairing
even. That has meant that people are often switching computers. Although this
hasn't been an issue for the application creator, who only solos, the rest of
the team wants to see their own tasks, and not left overs. So, we need to allow
user login and have separate data per user login.

Happily a password is not required for this feature, but given this troublesome
crowd, it may be coming soon.

~~~gherkin
In order for data to be isolated
  As a application user
  I would like to login in order to see my projects and tasks

  Scenario: When app starts
    Given I have started the application
    Then I should see a prompt for my username
    And I should not see a projects menu of any kind

  Scenario: Logging in to existing data
    Given I have started the application
    And I have created projects for this computer
    When I enter my username
    Then I should see a projects menu
    And I should be able to list projects and see the ones I have previously created

  Scenario: New log in
    Given I have started the application
    And I have not created any projects on this computer
    When I enter my username
    Then I should see a projects menu applicable for the empty project list

  Scenario: Logging out is a menu option
    Given I have started the application
    When I log in
    Then I should see a menu option 'o' for logging out

 Scenario: Logging out and logging in as someone else
    Given I have started the application
    When I log in
    And I enter 'o' as a command
    Then I will see a prompt for my username
    And I can enter another username to see their tasks
~~~