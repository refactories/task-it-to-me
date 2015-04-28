# Chore: Follow the color as your refactoring guide

IDEs will give you tons of information via syntax highlighting. That information
is in color.

In our code we see a bouquet of color indicating:

* keywords
* instance variables
* strings
* escape keys inside strings

This color can guide you towards cleaning up the code. In object-oriented
languages like Ruby, everything should be about passing messages. Messages are
your default IDE color. When you see other colors, you should be worried. In the
case of instance variables and literals like string, it is an indication that
your object oriented code is data or literal obsessed. More than likely the code
is going to be having inappropriate non-message passing contact with those oddly
colored items.

In this story we are going to take a pass at stripping out or at least
segregating color.
