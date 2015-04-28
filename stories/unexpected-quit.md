# Bug - Application unexpectedly quits

When trying to edit a project and there are no projects yet, the application
quits unexpectedly.

## Repro steps

1. Start the app
2. Type `e` to edit a project

### Expected behavior
An error message is displayed, but the application keeps running.

### Actual behaivor
An error message is displayed, and the application quit.