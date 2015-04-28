# Feature - Customer colors with a configuration file

Uptake of the app has greatly improved as reliability has gone up and
features have increased. Unfortunately the mostly male team is now at
the point where they cannot live with even a little pink text. The one senior
developer who is a woman was offended by request to eliminate pink. So as a
compromise, developers will be able to customize their own colors.

Product people have been able to push this down to a minimal viable
feature. Customization is going to be in the form of a json file in
data directory already established for persistence: `color.json`.

The team wants the freedom to set colors for background and foreground
for each type of output. They would also like to set text characteristics.
It turns out there is a pattern in all that formatting chaos:

~~~
    \033[[text colour;][text background;][text attribute]m[text]\033[m.
~~~

Above the first text and the reset code at the end are already abstracted out.
So probably a good approach is to make those fussy developers generate their
own escape codes inside the JSON.

Here is a [great article](http://www.opensourceforu.com/2011/08/spicing-up-console-for-fun-profit-1/).

~~~gherkin
As a fussy and macho application user
  I would like to choose my own color schemes
  In order to avoid being embarrassed by any pink text in my terminal

  Scenario: Default color display
    Given I have done no customization of the app output
    And I have started the application
    Then I should see default colors for each type of output which includes pink

  Scenario: Customizing a single output type
    Given I have customized the menu description to be be not-pink
    And I have started the application
    Then I should see menu descriptions in the configured color
    And I should see other output types in their default colors

  Scenario: Customizing every output type
    Given I have customized each of the 7 output types to have non-default values
    And I have started the application
    Then I should see the application in all its configured color glory
~~~
