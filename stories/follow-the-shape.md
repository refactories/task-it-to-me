# Chore: Follow the shape as your refactoring guide

One of the measures of good object oriented code is [cohesion](https://en.wikipedia.org/wiki/Cohesion_(computer_science)). Cohesion is a fuzzy measure of how much the methods belong together.

In the last exercise we extracted code with very low cohesion, which is to say
we extracted code cluttering our IDE with jarring colors.

Another easy to see indicator of cohesion is shape. When looking at a group of
methods, ones that look similar will generally have better cohesion than ones
that are shaped totally differently.

The goal of this chore is to group methods together by shape and color
to find that cohesion. Feel free to write comments describing what links groups
of methods as similar in concept. Where needed rename methods, arguments and
local variables to establish conventions. Extracting classes is welcome too.
When extracting classes, it is time to dig into all the logic contained in that
class via unit tests.