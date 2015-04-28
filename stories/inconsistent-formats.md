# Bug - Inconsistent console formatting

Formatting of the output was originally embedded directly into strings without
any abstraction. That lead to a fair amount of inconsistency between message
types.

As folks that work with CSS know, the distinction between colors and semantic
meanings of those colors are often confused. It's easy to use start out by
identifying a style by it's color only to have that color change while the
semantic goal of the formatting stays the same. For example, if you had error
formatting and started out calling it `red` and then the designers changed it
to a goldish-yellow, the code gets very confusing.

Use this bug to extract semantic formatting and ensure broader consistency.

## Repro steps

1. start the app
2. enter 'a' to add a project

## Expected

The prompt has coloring similar to other prompts for information.

## Actual

The prompt is not formatted


