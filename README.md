# Task it to me - Ruby refactoring exercise

## Instructions

Work through the story you are given, making the refactors that are
needed to get the story done. In the case of 'Chore' stories, the
refactoring expectation is given. In other stories, you will have to
judge on your own whether you are boiling the ocean, or skimping on
code change. There isn't a right answer, but there may be wrong answers.

Along the way we are going to find ways to measure the cost of each
story and each commit. Basic costing is going to be estimated by some metrics
encompassed in gems. The metrics are going to fail us in the fuzzy sense,
and so we need to supplement with some intuition. For example, we
will have metrics that show test coverage, but they don't analyze the
cost and style of those tests. We are going to need to think through
most things on our own.

## The app

The application itself is written in pure Ruby, no gem knowledge required.
It is run by calling an executable file located at the project's root
like this: `./task-it-to-me`.

It is a command line task management app.

## The tests

There is 100% test coverage. That can be confirmed via `rake coverage`. It
generates a report in `/coverage`.

Tests are in `rspec` and are dead simple to follow. The only helper function
helps strip out the color markup from the output so it is easier to make
assertions against.

To be testable the command line app dependency injects `stdin` and `stdout`. In
the executable, the Ruby globals `$stdin` and `$stdout` are passed in. In tests
[StringIO](https://ruby-doc.org/stdlib-2.6.4/libdoc/stringio/rdoc/StringIO.html)
is passed for each of those.

Stubbing of the user input is on the `stdin` in tests. We can inspect the
`string` of the `stdout` in order to make assertions on what is printed out.

## Stories

[Backstory](stories/backstory.md)

### Understanding the mess

1. [Bug - unexpected app quit when editing without projects](stories/unexpected-quit.md)
2. [Bug - commands fail if command has a space afterwards](stories/command-fails.md)
3. [Chore - follow the color](stories/follow-the-color.md)
4. [Chore - follow the shape](stories/follow-the-shape.md)

### Model

5. [Bug - duplicate projects](stories/duplicate-projects.md)
6. [Feature - numbered menu items](stories/numbered-menu-items.md)
7. [Feature - persist data between app runs](stories/save-data.md)

### View

1. [Feature - show menu after each command](stories/show-more-menu.md)
2. [Bug - inconsistent console formatting](stories/inconsistent-formats.md)

### Controller

1. [Feature - friendlier menus](stories/friendlier-menus.md)
2. [Chore - remove conditional](stories/remove-conditional.md)

### Stretch stories

1. [Feature - show recently finished tasks](stories/show-finished.md)
2. [Feature - custom colors with configuration](stories/configure-colors.md)
3. [Feature - multiple users](stories/multiple-users.md)
4. [Feature - super efficient commands](stories/super-efficient-commands.md)

[Conclusion](story/conclusion.md)

## Refactoring ethos

Refactoring on a project is complex since it operates in two axis:

1. How to unwind complex and often undocumented code? This is technical (and a
   bit archeological).
2. How much to do? This should be guided by economics/value. How easy is the
   code to change and which parts need to change?

While it can be tempting to want to implement a whole new architecture on any
project you start. Messes are just fine for the project if they never need to
change.

After gather or working enough in a project to feel like you can jump in,
refactoring should be guided by bugs and features. Things that need to change
and change often should be easy to understand and change. Whereas, code that was
written once but has no bugs or feature related to it can stay a terrible mess.

Refactoring isn't about creating perfection. It is about keeping a project
maintainable.

### How to Do a Story

Each story will come with it's own instructions. At the bottom there
will be a way to submit your solution.

## Guidelines

Make small PRs so you can get real feedback.

### Refactoring Guidelines

You have full test coverage!

The goal is to keep tests passing with each change. Katrina Owens, a master
refactorer has a rule: you should be one undo away from green tests at any
moment. When refactoring, it can be tempting to rip up the world and have it
come back together at some point in the future. That is a bad plan. So, in this
exercise, stay green. Integrate small changes quickly, and undo them when they
don't work as expected. Then take an even smaller step.

### Bugs Guidelines
Since all the tests are passing, and we have 100% coverage, any bug is a
failure in the tests. Here are steps for tackling a bug:

1. Investigate:
  * Look around
  * Come up with a theory
  * Find a way to test the theory
  * Take notes
  * Loop until confident of source of the problem
  * Rollback any code changes
2. Write a failing test
3. Make the test pass

### Feature Guidelines
Since features are new behavior, you are responsible for writing both
tests and code. Write the tests first. Putting aside any TDD related hype,
the process will help you focus onthe interfaces of objects and how they
communicate, rather than the details of implementation. Then write the code.
