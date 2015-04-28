# Bug - Duplicate projects

Project names can be duplicated and then can't be accessed.

## Repro steps

1. Start the app
2. Create a new project named 'cooking'
3. Create another project named 'cooking'
4. List the projects

### Expected behavior
Step 3 will not create a duplicate project, and when listed the name will appear
only once.

You can choose to also add a message that the project was not created, but this
is really diverging a little into product management.

### Actual behaivor
There are two projects named 'cooking' listed. Since we access projects by name,
we can't ever get to the later of the added projects.

## Notes on fixing this bug

Having the data for the app intermingled with other data makes it hard to start
adding validations, even when this is just one validation. We already solved
a bug caused by not knowing the state of the data. If you haven't already
extracted a model layer from the app, doing it now is important.

Extracting data while being one undo away from green tests is more challenging
than other extractions. For each data element, and each method related to that
data, the best approach is to:

1. Keep reading and writing to the existing location
2. Start writing (only not reading) from a new location/method
3. Switch to reading from the new location
4. Remove old location writing

When the data is coupled, this can become complicated. The goal should still be
to remaing within one undo of passing tests!