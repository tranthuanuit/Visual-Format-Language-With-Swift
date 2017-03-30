# Visual-Format-Language-With-Swift
 Visual Format String Grammar
( < orientation >: )?(< superview >< connection >)?< view >(< connection >< view >)*(< connection >< superview >)?
Notes:
- Direction of your constraints, not required. Can have the following values:
    - H: indicates horizontal orientation.
    - V: indicates vertical orientation.
    - Not specified: Auto Layout defaults to horizontal orientation.
- Leading connection to the superview, not required.
- Spacing between the top edge of your view and its superview’s top edge (vertical).
- Spacing between the leading edge of your view and its superview’s leading edge (horizontal).
- View you’re laying out, is required.
- Connection to another view, not required.
- Trailing connection to the superview, not required.
- Spacing between the bottom edge of your view and its superview’s bottom edge (vertical)
- Spacing between the trailing edge of your view and its superview’s trailing edge (horizontal)
- There are two special (orange) characters in the image and their definition is below:
? component is not required inside the layout string.
- * component may appear 0 or more times inside the layout string.

Available Symbols
VFL uses a number of symbols to describe your layout:
    - | superview
    - - standard spacing (usually 8 points; value can be changed if it is the spacing to the edge of a superview)
    - == equal widths (can be omitted)
    - -20- non standard spacing (20 points)
    - <= less than or equal to
    - >= greater than or equal to
    - @250 priority of the constraint; can have any value between 0 and 1000
        - 250 - low priority
        - 750 - high priority
        - 1000 - required priority

Example Format String
  H:|-[icon(==iconDate)]-20-[iconLabel(120@250)]-20@750-[iconDate(>=50)]-|
Here's a step-by-step explanation of this string:
- H: horizontal direction.
- |-[icon icon's leading edge should have standard distance from its superview's leading edge.
- ==iconDate icon's width should be equal to iconDate's width.
- ]-20-[iconLabel icon's trailing edge should be 20 points from iconLabel's leading edge.
- [iconLabel(120@250)] iconLabel should have a width of 120 points. The priority is set to low, and Auto Layout can break this constraint if a conflict arises.
- -20@750- iconLabel's trailing edge should be 20 points from iconDate's leading edge. The priority is set to high, so Auto Layout shouldn't break this constraint if there's a conflict.
- [iconDate(>=50)] iconDate's width should be greater than or equal to 50 points.
- -| iconDate's trailing edge should have standard distance from its superview's trailing edge.
