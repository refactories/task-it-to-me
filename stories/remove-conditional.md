# Chore - Remove conditional

The gigantic loop should be refined so that we only have one place where we are
collecting the command per loop. That makes some room for switching away from
this massive and ugly case statement, with the embedded if/else. We want to move
away from these traditional branching structures in this chore and towards
little command objects.

Use the pattern [Replace Conditional with Polymorphism](http://www.refactoring.com/catalog/replaceConditionalWithPolymorphism.html) to eliminate the branching.
